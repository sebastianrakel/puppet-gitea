class gitea (
  String[1] $version,
  String[1] $home,
  String[1] $user,
  String[1] $group,
  String[1] $repository_path,
  String[1] $app_name,
  String[1] $domain,
  Enum['dev', 'prod'] $run_mode,
  Enum['postgresql', 'sqlite'] $database_type,
  String $database_host,
  String $database_name,
  String $database_user,
  String $database_password,
  Enum['http','unix'] $http_protocol,
  String[1] $http_addr,
  Integer $http_port,
  String[1] $root_url,
  Boolean $disable_registration,
  Boolean $disable_git_hooks,
) {
  contain gitea::install
  contain gitea::database
  contain gitea::config
  contain gitea::service

  Class['gitea::install'] -> Class['gitea::database'] -> Class['gitea::config'] ~> Class['gitea::service']
}
