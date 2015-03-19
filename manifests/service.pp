class discourse::service (

  $discourse_root,

) inherits discourse::params {

    service { 'discourse':
        ensure     => running,
        enable     => true,
        start      => "${discourse_root}/./launcher start app",
        stop       => "${discourse_root}/./launcher stop app",
        hasrestart => true,
        pattern    => 'discourse',
        provider   => 'base',
        require    => Exec['bootstrap_discourse'],
    }

    exec { 'bootstrap_discourse':
        cwd         => "${discourse_root}",
        command     => "${discourse_root}/./launcher bootstrap app < y",
        timeout     => '0',
        logoutput   => true,
        refreshonly => true,
    }
}
