class gitea::install {
  group { $gitea::group:
    ensure => present,
  }

  user { $gitea::user:
    managehome => true,
    home       => $gitea::home,
    groups     => [$gitea::group],
    require    => Group[$gitea::group],
  }

  $gitea_dirs = [
    "${gitea::home}/gitea/",
  ]

  file { $gitea_dirs:
    ensure => 'directory',
    owner  => $gitea::user,
    group  => $gitea::group,
  }

  file { "${gitea::home}/gitea/gitea":
    source => "https://dl.gitea.io/gitea/${gitea::version}/gitea-${gitea::version}-linux-amd64",
    mode   => '0700',
    owner  => $gitea::user,
    group  => $gitea::group,
  }
}
