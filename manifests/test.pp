# -*- tab-width:3;indent-tabs-mode:nil;  -*-
#
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:
#

import "test/*.pp"

## 
# The default node
##
node default {
}

##
# A default node
##
node default_node inherits default {

   class {"apt::fs": stage => "file"}
   class {"apt::run::update": stage => "prepackage"}

}


##
## Run Stages
##
#
##
# There are 10 Stages
#
## PreFiles / Bootstrap (name: bootstrap)
# The bootstrapping stage
#  - creating users
#  - creating groups
#  - ...
# 
## Files (name: file)
# In this stage the configuration is done for things that needs to be configured before the packages are being installed.
#  - source.list or yum.repos.de
#  - /etc/default files
#  - Filesystem Permissions
#  - ...
#
## PostFiles / PrePackages / PreMain (name: prepackage)
# Things that must be done before the main stage.
#  - run apt-get update or yum makecache
#  - there are not much things in this stage (i think)
#  - ...
#
## Main
# The main stage
#  - do package installations
#  - ...
#
### PostPackages (name: postpackage)
# Create needed directory structures 
#
## PostPackages / PreServices / Configuration (name: configuration)
# Manage configuration files of daemons, ...
#  - configure services/daemons
#  - ...
#
## Services (name: service)
# Start / Stop services
#  - Add services to runlevels
#  - Start/Stop services
#
## PostServices (name: postservice)
# This that must be done after service restarts, ...
#  - Normaly not much in here
#
## PreApplication (name: preapp)
# Do things that have to be done before you deploy your software.
#  - Creating configuration files
#  - Remove Systems from Loadbalancer
#  - ...
#
## Application (name: app)
# Deploy your application
#  - ...
#
## PostApplication (name: postapp)
# Do things that have to be done after your deployment
#  - Cache purges
#  - Add Systems to Loadbalancers
#  - ...

stage { "bootstrap": before => Stage['file']}
stage { "file": require => Stage['bootstrap']}
stage { "prepackage": require => Stage['file']}
### default: stage { "main": require => Stage['prepackage'] }
stage { "postpackage": require => Stage['main']}
stage { "configuration": require => Stage['postpackage']}
stage { "service": require => Stage['configuration']}
stage { "postservice": require => Stage['service']}
stage { "preapp": require => Stage['postservice']}
stage { "app": require => Stage['preapp']}
stage { "postapp": require => Stage['app']}



