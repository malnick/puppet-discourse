define discourse::pup_template (
  $template             => $name,
  $discourse_root,
  $pup_template_module,
){
  file { $template:
    ensure    => file,
    path      => "${discourse_root}/containers/${template}",
    content   => template("${pup_templates_module}/${template}"
  }
}
