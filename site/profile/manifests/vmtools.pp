# Configure open-vm-tools
class profile::vmtools {

  if $::virtual == 'vmware' {
    package { 'open-vm-tools': }
  }

}
