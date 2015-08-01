#!/usr/bin/env bash

sudo apt-get -y update
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server-5.5
sudo apt-get -y install build-essential git-core libyaml-dev libxml2 libxml2-dev libxslt1-dev nodejs mysql-client libmysqlclient-dev zsh

cd

/usr/bin/zsh <<'EOF'
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
sudo chsh -s /bin/zsh vagrant
EOF

wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0/
sudo make install

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

cat <<EOF >> ~/.zshrc

source /usr/local/share/chruby/chruby.sh
chruby ruby-2.2.2
EOF

ruby-install ruby 2.2.2

source /usr/local/share/chruby/chruby.sh

cd /huntthemdown

chruby ruby-2.2.2

gem install bundler --no-rdoc --no-ri
bundle install

bundle exec rake db:setup db:migrate