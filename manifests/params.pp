class discourse::params {

    $ssl_enabled                = false
    $ssl_key                    = undef
    $ssl_cert                   = undef
    $manage_docker              = true
    $docker_bind                = '0.0.0.0'
    $discourse_project_repo     = 'https://github.com/discourse/discourse_docker.git', 
    $pup_templates              = ['web_only.yml']
}
