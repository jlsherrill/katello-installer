# = Foreman Proxy Pulp Node plugin
#
# This class installs pulp node plugin
#
# === Parameters:
#
# $group::        group owner of the configuration file
#
# $enabled::      enables/disables the plugin
#
# $pulp_url::     pulp url to use
#
class foreman_proxy::plugin::pulpnode (
  $enabled  = $foreman_proxy::plugin::pulpnode::params::enabled,
  $group = $foreman_proxy::plugin::pulpnode::params::group,
  $pulp_url = $foreman_proxy::plugin::pulpnode::params::pulp_url,
) inherits foreman_proxy::plugin::pulpnode::params {

  foreman_proxy::plugin {'pulpnode':
    package => 'rubygem-smart_proxy_pulp',
  } ->
  file {'/etc/foreman-proxy/settings.d/pulpnode.yml':
    ensure  => file,
    content => template('foreman_proxy/plugin/pulpnode.yml.erb'),
    owner   => 'root',
    group   => $group,
    mode    => '0640',
  }
}
