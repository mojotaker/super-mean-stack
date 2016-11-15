class build_essential_install {


  $sysPackages = [ "build-essential", "curl", "libssl-dev",
    "git-core"]
  package { $sysPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}

