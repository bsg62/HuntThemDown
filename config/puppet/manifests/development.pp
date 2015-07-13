$as_vagrant   = 'sudo -u vagrant -H bash -l -c'
$home = '/home/vagrant'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Preinstall Stage ---------------------------------------------------------

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
    unless => "test -e ${home}/.rvm"
  }
}

class { 'apt_get_update':
  stage => preinstall
}

package { 'curl':
  ensure => installed
}

package { 'build-essential':
  ensure => installed
}

package { 'git-core':
  ensure => installed
}

# Nokogiri dependencies.
package { ['libyaml-dev', 'libxml2', 'libxml2-dev', 'libxslt1-dev']:
  ensure => installed
}

# ExecJS runtime.
package { 'nodejs':
  ensure => installed
}

# MySQL server & client

package { 'mysql-server':
  ensure => installed
}

package { 'mysql-client':
  ensure => installed
}

package { 'libmysqlclient-dev':
  ensure => installed
}


# --- Ruby ---------------------------------------------------------------------

exec { 'install_rvm_public_key':
  cwd => "${home}",
  command => "${as_vagrant} 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'",
  creates => "${home}/.gnupg/secring.gpg"
}

exec { 'install_rvm':
  cwd => "${home}",
  command => "${as_vagrant} 'curl -sSL https://get.rvm.io | bash -s stable'",
  creates => "${home}/.rvm",
  require => [ Package['curl'], Exec['install_rvm_public_key'] ]
}

exec { 'install_ruby':
  command => "${as_vagrant} '${home}/.rvm/bin/rvm install 2.1.1 --autolibs=enabled'",
  creates => "${home}/.rvm/bin/ruby",
  timeout => 600,
  require => [ Package['libyaml-dev'], Exec['install_rvm'] ]
}

exec { 'set_default_ruby':
  command => "${as_vagrant} '${home}/.rvm/bin/rvm --fuzzy alias create default 2.1.1 && ${home}/.rvm/bin/rvm use default'",
  require => Exec['install_ruby']
}

exec { 'install_bundler':
  command => "${as_vagrant} 'gem install bundler --no-rdoc --no-ri'",
  creates => "${home}/.rvm/bin/bundle",
  require => Exec['set_default_ruby']
}

exec { 'bundle_install':
  cwd => '/huntthemdown',
  command => "${as_vagrant} 'bundle install'",
  require => Exec['install_bundler']
}

exec { 'db_setup':
  cwd => '/huntthemdown',
  command => "${as_vagrant} 'bundle exec rake db:setup db:migrate'",
  require => Exec['bundle_install']
}
