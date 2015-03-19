class discourse::params {

    $ssl_enabled                = false
    $ssl_key                    = undef
    $ssl_cert                   = undef
    $manage_docker              = true
    $docker_bind                = '0.0.0.0'
    $discourse_email            = undef
    $discourse_hostname         = $::fqdn
    $discourse_smtp             = undef
    $discourse_smtp_user        = undef
    $discourse_user_pw          = undef
    # Default plugins
    $plugins                    = [] 
    $discourse_root             = '/var/discourse/'


}
