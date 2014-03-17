class tor::repo (
  $ensure      = present,
  $source_name = 'torproject.org',
  $include_src = false,
) {

  case $::osfamily {
    'Debian': {
        $key      = '886DDD89'
        $location = 'https://deb.torproject.org/torproject.org/'
        class { 'tor::repo::debian': }
      }

    default: {
      if($ensure == 'present' or $ensure == true) {
        fail("Unsupported managed repository for osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}, module ${module_name} currently only supports managing repos for osfamily Debian and Ubuntu")
      }
    }
  }
}
