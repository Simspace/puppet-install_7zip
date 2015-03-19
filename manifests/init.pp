class install_7zip (
  $installer = $install_7zip::params::installer,
) inherits install_7zip::params {
  include staging

  if $::operatingsystem == 'windows' {

    $exe = inline_template('<%= File.basename(@installer) %>')

    acl { "${staging_windir}/install_7zip/${exe}":
      purge => false,
      permissions => [ { identity => 'Administrators', rights => ['full'] },],
      }

      staging::file { $exe:
        source => $installer,
        }


        package { '7-Zip 9.20':
          ensure => installed,
          source => "${staging_windir}\\install_7zip\\${exe}",
          require => [ Staging::File[$exe], Acl["${staging_windir}/install_7zip/${exe}"] ],
          install_options => '/S',
          }
  }
}
