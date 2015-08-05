class discourse::config (
  $mandril_api_key,
  $discourse_root             = $discourse::params::discourse_root,
  $pup_templates              = $discourse::params::pup_templates,
  $pup_templates_module       = $discourse::params::pup_templates_module,
  $ssl_key                    = $discourse::params::ssl_key, 
  $ssl_cert                   = $discourse::params::ssl_cert,
) inherits discourse::params {

  discourse::pup_template { $pup_templates:
    pup_templates_module  => $pup_templates_module,
    discourse_root        => $discourse_root,
  }
}
