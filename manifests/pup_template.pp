define discourse::pup_template (
  $template             = $name,
  $discourse_root,
  $pup_templates_module,
  $psql_password,
){
  $temp_base = basename($template, '.erb')
  notify {"${temp_base}: ${psql_password}":}
  file { $template:
    ensure    => file,
    path      => "${discourse_root}/templates/${temp_base}",
    content   => template("${pup_templates_module}/${template}")
  }

}
