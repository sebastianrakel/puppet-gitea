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
    mode   => '0700',
  }

  $gitea_binary_path = "${gitea::home}/gitea/gitea"
  $tmp_gitea_path = "/tmp/gitea-${gitea::version}"
  archive { $tmp_gitea_path:
    source  => "https://dl.gitea.io/gitea/${gitea::version}/gitea-${gitea::version}-linux-amd64",
    mode    => '0700',
    owner   => $gitea::user,
    group   => $gitea::group,
    creates => $tmp_gitea_path,
    before  => File[$gitea_binary_path],
  }

  file { $gitea_binary_path:
    ensure => 'file',
    source => $tmp_gitea_path,
    mode   => '0700',
    owner  => $gitea::user,
    group  => $gitea::group,
    before => File['/usr/local/bin/gitea'],
  }

  file { "/usr/local/bin/gitea":
    ensure => 'link',
    target => $gitea_binary_path,
  }
}
