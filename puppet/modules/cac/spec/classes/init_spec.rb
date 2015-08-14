require 'spec_helper'
describe 'cac' do

  context 'with defaults for all parameters' do
    it { should contain_class('cac') }
  end
end
