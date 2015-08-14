# puppetcac
This module will configure (initially CentOS 7) systems for cac logins.  This repo is a work in progress, I am gathering all of the
packages that are needed to get cac login working with (Redhat family OS).


This module can now auto-join an active directory server and provide kerberos authentication between all configured hosts.  This module is
almost finished.  I am working on CAC authentication piece. CAC config and setup are complete.
I have not verified puppet module for active directory cac login...check back later to see updated message.




Current setup:


To change to password only for ssh in the common.yaml file:

GSSAPIAuthentication no           
GSSAPICleanupCredentials no       
GSSAPIKeyExchange no
PasswordAuthentication yes

To change to kerberos for ssh in the common.yaml file:

GSSAPIAuthentication  yes          
GSSAPICleanupCredentials  yes      
GSSAPIKeyExchange yes
PasswordAuthentication no

CAC config and setup are complete...have not verified puppet module for active directory cac login.
