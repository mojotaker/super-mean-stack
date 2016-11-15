class support {
  group { "puppet" :
    ensure => present,
    name => "puppet";
  }

  Package { ensure => installed }

  package {
    ["curl",
      "build-essential"
    ]:
  }

  file { "/home/vagrant/app":
    ensure => "directory"
  }
}