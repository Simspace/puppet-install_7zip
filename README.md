# install_7zip

#### Table of Contents
1. [Overview](#overview)
2. [Description](#description)
3. [Dependencies](#dependencies)
4. [Development](#development)

## Overview
This module will install 7zip on a windows host

## Description
In params.pp is the location to the installer.
In your site.pp
```puppet
node 'cheese.com' {
  class {'install_7zip':}
}
```

## Dependencies
staging
ACL
