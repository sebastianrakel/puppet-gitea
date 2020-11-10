class gitea::service {
  systemd::unit_file { 'gitea.service':
    content => epp("${module_name}/gitea.service.epp", {
      gitea_user    => $gitea::user,
      gitea_group   => $gitea::group,
      gitea_home    => $gitea::home,
      database_type => $gitea::database_type,
    }),
  }
  ~> service { 'gitea':
    ensure => 'running',
    enable => true,
  }
}
