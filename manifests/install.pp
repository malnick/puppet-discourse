class discourse::install(
    
  $manage_docker,     
  $discourse_root,   
  $discourse_project_repo,

) inherits discourse::params {

  if $manage_docker {
    include ::docker
  }

  vcsrepo { $discourse_root:
    ensure      => present,
    provider    => 'git',
    source      => $discourse_project_repo,
  }
}
