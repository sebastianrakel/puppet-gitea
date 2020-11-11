class gitea (
  String[1] $version,
  String[1] $home,
  String[1] $user,
  String[1] $group,
  String[1] $repository_path,
  String[1] $app_name,
  String[1] $domain,
  Enum['dev', 'prod'] $run_mode,
  Enum['postgresql'] $database_type,
  String $database_name,
  String $database_user,
  String $database_password,
  Enum['http','unix'] $http_protocol,
  String[1] $http_addr,
  Integer $http_port,
  String[1] $root_url,
) {
  contain gitea::install
  contain gitea::database
  contain gitea::config
  contain gitea::service

}
