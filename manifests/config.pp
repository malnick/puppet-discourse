# Config class
# Requires discourse email, smtp address, smtp user, user pw, and optional plugins

class discourse::config (

    $discourse_root,
    $discourse_email            = $discourse::params::discourse_email, 
    $discourse_hostname         = $discourse::params::discourse_hostname,
    $discourse_smtp             = $discourse::params::discourse_smtp,
    $discourse_smtp_user        = $discourse::params::discourse_smtp_user,
    $discourse_user_pw          = $discourse::params::discourse_user_pw,
    $plugins                    = $discourse::params::plugins,
    $ssl_enabled                = $discourse::params::ssl_enabled,
    $ssl_key                    = $discourse::params::ssl_key, 
    $ssl_cert                   = $discourse::params::ssl_cert,

) inherits discourse::params {
    # Manage the app.yml

    file { "${discourse_root}/containers/app.yml":
        ensure  => file,
        content => template('discourse/app.yml.erb'),
        notify  => Exec['bootstrap_discourse'],
    }
}
