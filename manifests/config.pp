class discourse::config (
  $discourse_root             = $discourse::params::discourse_root,
  $pup_templates              = $discourse::params::pup_templates,
  $ssl_key                    = $discourse::params::ssl_key, 
  $ssl_cert                   = $discourse::params::ssl_cert,
) inherits discourse::params {
  $pup_templates.each |$t| {
    file { "${discourse_root}/containers/${t}":
      ensure  => file,
      file    => "puppet:///modules/discourse/${t}", 
      notify  => Exec['bootstrap_discourse'],
    }
  }
}
