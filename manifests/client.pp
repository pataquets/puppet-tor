class tor::client (
  allow_dotexit             = 0,
  allow_single_hop_circuits = 0,
  exclude_single_hop_relays = 1,
  exclude_nodes             = '',
  exclude_exit_nodes        = '',
  exit_nodes                = '',
  entry_nodes               = '',
  strict_nodes              = 0,
) {
  concat::fragment { '09.client':
    ensure  => present,
    content => template('tor/torrc.client.erb'),
    owner   => 'debian-tor',
    group   => 'debian-tor',
    mode    => '0644',
    order   => 09,
    target  => $tor::daemon::config_file,
  }
}
