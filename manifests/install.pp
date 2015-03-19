class discourse::install(
    
    $manage_docker,     
    $discourse_root,   

) inherits discourse::params {

    if $manage_docker {
        include ::docker
    }

    vcsrepo { $discourse_root:
        ensure      => present,
        provider    => 'git',
        source      => 'https://github.com/discourse/discourse_docker.git',
    }
}
