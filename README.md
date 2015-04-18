# Wote

Simple Ruby on Rails app that can be used to collect...

## Setup

### Prerequisites (if you want to use vagrant box)

#### Virtualbox

```bash
$ sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install -y virtualbox-4.3 dkms

#### Vagrant

```bash
$ sudo apt-get install vagrant
```

#### Clone project

```bash
$ git clone git@bitbucket.org:dperic/wote.git ~/dev/wote
```

#### Run vagrant (first time it takes a bit longer)

```bash
$ cd ~/dev/wote
$ vagrant up
$ vagrant ssh
```

#### Install/Setup

```bash
$ bundle
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

#### Run

```bash
$ bin/rails server -b 0.0.0.0
```
