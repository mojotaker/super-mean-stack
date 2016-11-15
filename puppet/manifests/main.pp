$node_version = "v6.0.0"


Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/versions/node/${node_version}/bin"] }

exec { 'apt-get update':}

# Install Build Essentials
include build_essential_install

/*
#Install NVM
class { 'nvm':
  user => 'vagrant',
  install_node => $node_version,
}
*/

# Install Node
class { 'nvm':
  node_version => $node_version,
  require => [Class["build_essential_install"]]
}

define npm( $directory="/home/vagrant/nvm/versions/node${node_version}/lib/node_modules" ) {
  exec { "install-${name}-npm-package":
    unless => "test -d ${directory}/${name}",
    command => "npm install -g ${name}",
    logoutput => true,
    require => Exec['install-node']
  }
}

# Global npm modules
npm { ["nodemon", "grunt-cli", "bower"]:
}

# Make sure our code directory has proper permissions
file { '/home/vagrant/*':
  ensure => "directory",
  owner  => "vagrant",
  group  => "vagrant"
}



#install node modules
include npm_install

#Install and bootstrap Nginx
include nginx

#install Mongodb
class {'::mongodb::server':
  port    => 27018,
  verbose => true,
}

#install Git
#include git

class {'motd':
  ensure => present,
  inline_template => "Welcome to my ass",
}


#configure Packages

