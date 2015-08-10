class discourse::service (

  $discourse_root,

) inherits discourse::params {


  file { '/etc/init.d/discourse':
    ensure      => file,
    mode        => '0755',
    content     => template('discourse/discourse_init.erb'),
    notify      => Service['discourse'],
  }

  service { 'discourse':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }
}
