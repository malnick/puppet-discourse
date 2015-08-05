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
    $discourse_root             = $discourse::params::discourse_root,
    $manage_docker              = $discourse::params::manage_docker,
    $pup_templates              = $discourse::params::pup_templates,
    $discourse_project_repo     = $discourse::params::discourse_project_repo,
    $ssl_cert                   = undef,
    $ssl_key                    = undef,
    $mandril_api_key            = undef,
    $discourse_psql_pw          = undef,
) inherits discourse::params {
    class { ::discourse::install:
      discourse_root          => $discourse_root,
      discourse_project_repo  => $discourse_project_repo,
      manage_docker           => $manage_docker,
    }
    ->
    class { ::discourse::config:
      ssl_cert           => $ssl_cert,
      ssl_key            => $ssl_key,
      pup_templates      => $pup_templates,
      discourse_root     => $discourse_root,
      mandril_api_key    => $mandril_api_key,
      discourse_psql_pw  => $discourse_psql_pw,
    }
    ->
    class { ::discourse::service: discourse_root => $discourse_root }

}
    
