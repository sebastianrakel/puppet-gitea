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
    '/etc/gitea/',
    "${gitea::home}/gitea/",
  ]

  file { $gitea_dirs:
    ensure => 'directory',
    owner  => $gitea::user,
    group  => $gitea::group,
  }

  $gitea_binary_path = "${gitea::home}/gitea/gitea"
  file { $gitea_binary_path:
    source => "https://dl.gitea.io/gitea/${gitea::version}/gitea-${gitea::version}-linux-amd64",
    mode   => '0700',
    owner  => $gitea::user,
    group  => $gitea::group,
  }

  file { "/usr/local/bin/gitea":
    ensure => 'link',
    target => $gitea_binary_path,
  }
}
