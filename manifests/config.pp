class gitea::config {
  $gitea_db_type = case $gitea::database_type {
    'postgresql': {
      'postgres'
    }
  }

  $settings = {
    'DEFAULT'    => {
      'APP_NAME' => $gitea::app_name,
      'RUN_USER' => $gitea::user,
      'RUN_MODE' => $gitea::run_mode,
    },
    repository => {
      'ROOT' => $gitea::repository_path,
    },
    database   => {
      'DB_TYPE' => $gitea_db_type,
      'NAME'    => $gitea::database_name,
      'USER'    => $gitea::database_user,
      'PASSWD'  => $gitea::database_password,
    },
    server     => {
      'PROTOCOL'  => $gitea::http_protocol,
      'HTTP_ADDR' => $gitea::http_addr,
      'HTTP_PORT' => $gitea::http_port,
      'DOMAIN'    => $gitea::domain,
    }
  }

  $settings.each | String $section, Hash $pairs | {
    $pairs.each | String $key, $value | {
      ini_setting { "ini_${section}_${key}":
        ensure  => present,
        path    => '/etc/gitea/app.ini',
        section => $section,
        setting => $key,
        value   => $value,
      }
    }
  }
}
