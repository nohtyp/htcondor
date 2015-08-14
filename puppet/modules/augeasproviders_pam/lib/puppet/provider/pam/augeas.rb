# Alternative Augeas-based providers for Puppet
#
# Copyright (c) 2012 Greg Swift
# Licensed under the Apache License, Version 2.0

Puppet::Type.type(:pam).provide(:augeas, :parent => Puppet::Type.type(:augeasprovider).provider(:default)) do
  desc "Uses Augeas API to update an pam parameter"

  # Boolean is the key because they either do or do not provide a
  # value for control to work against.  Module doesn't work against
  # control
  PAM_POSITION_ALIASES = {
      true  => { 'first'  => "*[type='%s' and control='%s'][1]",
                 'last'   => "*[type='%s' and control='%s'][last()]",
                 'module' => "*[type='%s' and module='%s'][1]", },
      false => { 'first'  => "*[type='%s'][1]",
                 'last'   => "*[type='%s'][last()]", },
  }

  confine :feature => :augeas

  default_file { '/etc/pam.d/system-auth' }

  def self.target(resource = nil)
    if resource and resource[:service] and not resource[:target]
      "/etc/pam.d/#{resource[:service]}".chomp('/')
    else
      super
    end
  end

  lens do |resource|
    target(resource) == '/etc/pam.conf' ? 'pamconf.lns' : 'pam.lns'
  end

  resource_path do |resource|
    service = resource[:service]
    type = resource[:type]
    mod = resource[:module]
    control_cond = (resource[:control_is_param] == :true) ? "and control='#{resource[:control]}'" : ''
    if target == '/etc/pam.conf'
      "$target/*[service='#{service}' and type='#{type}' and module='#{mod}' #{control_cond}]"
    else
      "$target/*[type='#{type}' and module='#{mod}' #{control_cond}]"
    end
  end

  def self.position_path (position, type)
    placement, identifier, value = position.split(/ /)
    key = !!value
    if PAM_POSITION_ALIASES[key].has_key? identifier
      expr = PAM_POSITION_ALIASES[key][identifier]
      expr = key ? expr % [type, value] : expr % [type]
    else
      # if the identifier is not in the mapping
      # we assume that its an xpath and so
      # join everything after the placement
      expr = position.split(/ /)[1..-1].join(" ")
    end
    return expr, placement
  end

  def in_position?
    unless resource[:position].nil?
      path, before = self.class.position_path(resource[:position], resource[:type])

      if before == 'before'
        mpath = "#{resource_path}[following-sibling::#{path}]"
      else
        mpath = "#{resource_path}[preceding-sibling::#{path}]"
      end

      augopen do |aug|
        !aug.match(mpath).empty?
      end
    end
  end

  def self.instances
    augopen do |aug|
      resources = []
      aug.match("$target/*[label()!='#comment']").each do |spath|
        optional = aug.match("#{spath}/optional").empty?.to_s.to_sym
        type = aug.get("#{spath}/type")
        control = aug.get("#{spath}/control")
        mod = aug.get("#{spath}/module")
        arguments = aug.match("#{spath}/argument").map { |p| aug.get(p) }
        entry = {:ensure    => :present,
                 :optional  => optional,
                 :type      => type,
                 :control   => control,
                 :module    => mod,
                 :arguments => arguments}
        if target == '/etc/pam.conf'
          entry[:service] = aug.get("#{spath}/service")
        end
        resources << new(entry)
      end
      resources
    end
  end

  define_aug_method!(:create) do |aug, resource|
    path = next_seq(aug.match('$target/*'))
    entry_path = "$target/#{path}"
    # we pull type, control, and position out because we actually
    # work with those values, not just reference them in the set section
    # type comes to us as a symbol, so needs to be converted to a string
    type = resource[:type].to_s
    control = resource[:control]
    position = resource[:position]
    unless position.nil?
      expr, placement = self.position_path(position, type)
      aug.insert("$target/#{expr}", path, placement == 'before')
    end
    if resource[:optional] == :true
      aug.touch("#{entry_path}/optional")
    end
    if target == '/etc/pam.conf'
      aug.set("#{entry_path}/service", resource[:service])
    end
    aug.set("#{entry_path}/type", type)
    aug.set("#{entry_path}/control", control)
    aug.set("#{entry_path}/module", resource[:module])
    resource[:arguments].each do |argument|
      aug.set("#{entry_path}/argument[last()+1]", argument)
    end
  end

  define_aug_method(:optional) do |aug, resource|
    aug.match("$resource/optional").empty?.to_s.to_sym
  end

  define_aug_method!(:optional=) do |aug, resource, value|
    if resource[:optional] == :true
      if aug.match("$resource/optional").empty?
        aug.clear("$resource/optional")
      end
    else
      aug.rm("$resource/optional")
    end
  end

  attr_aug_accessor(:control)

  attr_aug_accessor(:arguments, :type => :array, :label => 'argument')

end
