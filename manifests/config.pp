class discourse::config (
  $psql_password              = undef,
  $smtp_password              = undef,
  $main_template              = undef,
  $mandril_api_key            = undef,
  $discourse_psql_pw          = undef,
  $discourse_root             = $discourse::params::discourse_root,
  $pup_templates              = $discourse::params::pup_templates,
  $pup_templates_module       = $discourse::params::pup_templates_module,
  $ssl_key                    = $discourse::params::ssl_key, 
  $ssl_cert                   = $discourse::params::ssl_cert,
) inherits discourse::params {

  $main_base = basename($main_template, '.erb')

  file {$main_template:
    ensure    => file,
    path      => "${discourse_root}/containers/${main_base}",
    content   => template("${pup_templates_module}/${main_template}"),
  }

  discourse::pup_template { $pup_templates:
    pup_templates_module  => $pup_templates_module,
    discourse_root        => $discourse_root,
  }
}
