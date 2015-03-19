# discourse
# puppet-discourse module
This module installs and configures a baseline discourse node in a docker container. 

## Notes
You should be familiar with how discourse and docker 

## Install with SSL

``ruby
class profiles::discourse::ssl_enabled{

    class { ::discourse:
        discourse_email     => 'someuser@yourorg.com',
        discourse_hostname  => 'yourorg.com',
        discourse_smtp      => 'smtp.mandrillapp.com',
        discourse_smtp_user => 'admin@yourorg.com',
        discourse_user_pw   => hiera('where::you::keep::this::shit'),
        plugins             => ['discourse/docker_manager']
        ssl_enabled         => true,

        # Both the cert and key are expected to be in hiera
        # The key should be in eyaml 
        # Place them in a hiera data file with the following keys:
        ssl_cert            => hiera('profiles::discourse::ssl_cert'),
        ssl_key             => hiera('profiles::discourse::ssl_key'),
    }
}
```
