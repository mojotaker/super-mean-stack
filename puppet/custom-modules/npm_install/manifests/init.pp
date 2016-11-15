class npm_install {

  Exec { path => ['/usr/local/bin',
    '/usr/local/sbin',
    '/usr/bin/',
    '/usr/sbin',
    '/bin',
    '/sbin',
    "/home/vagrant/nvm/versions/node/${node_version}/bin"
  ]
  }

  /*Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }*/

  exec { "npm_install":
          cwd =>  "/home/vagrant/app",
          # command   => "which node",
          command => "npm install --no-bin-links",
          # environment => ['/home/vagrant/nvm/versions/node/v6.0.0/bin/node'],
          logoutput => true,
          require => Exec['install-node']
  }
}

