# == Class: discourse
#
# Full description of class discourse here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'discourse':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class discourse (
    
    $discourse_email            = $discourse::params::discourse_email, 
    $discourse_hostname         = $discourse::params::discourse_hostname,
    $discourse_smtp             = $discourse::params::discourse_smtp,
    $smtp_user                  = $discourse::params::smtp_user,
    $smtp_pw                    = $discourse::params::smtp_pw,
    $plugins                    = $discourse::params::plugins,   
    $ssl_enabled                = $discourse::params::ssl_enabled,
    $discourse_root             = $discourse::params::discourse_root,
    $manage_docker              = $discourse::params::manage_docker,

) inherits discourse::params {
    class { ::discourse::install:
      discourse_root   => $discourse_root,
      manage_docker    => $manage_docker,
    }
    ->
    class { ::discourse::config:
        ssl_enabled         => $ssl_enabled,
        plugins             => $plugins,
        discourse_email     => $discourse_email,
        discourse_hostname  => $discourse_hostname,
        discourse_smtp      => $discourse_smtp,
        smtp_user           => $smtp_user,
        smtp_pw             => $smtp_pw,
        discourse_root      => $discourse_root,
    }
    ->
    class { ::discourse::service: discourse_root => $discourse_root }

}
    
