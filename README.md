# puppet-gitea

[![Build Status](https://github.com/sebastianrakel/puppet-gitea/workflows/CI/badge.svg)](https://github.com/sebastianrakel/puppet-gitea/actions?query=workflow%3ACI)
[![Release](https://github.com/sebastianrakel/puppet-gitea/actions/workflows/release.yml/badge.svg)](https://github.com/sebastianrakel/puppet-gitea/actions/workflows/release.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/sebastianrakel/gitea.svg)](https://forge.puppetlabs.com/sebastianrakel/gitea)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/sebastianrakel/gitea.svg)](https://forge.puppetlabs.com/sebastianrakel/gitea)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/sebastianrakel/gitea.svg)](https://forge.puppetlabs.com/sebastianrakel/gitea)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/wireguard.svg)](https://forge.puppetlabs.com/sebastianrakel/gitea)
[![AGPL v3 License](https://img.shields.io/github/license/sebastianrakel/puppet-gitea.svg)](LICENSE)

Puppet module to configure gitea

* [Setup](#setup)
* [Example configurations](#example-configurations)
* [Parameter reference](#parameter-reference)
* [Tests](#tests)
* [Contributions](#contributions)
* [License and Author](#-icense-and-author)

## Setup

This module installs gitea from upstream binary

## Example configurations

Install a gitea with default settings

```puppet
class {'gitlab':
}
```

Install gitea with postgresql backend, needs an installed 

```puppet
class {'gitlab':
  database_type     => 'postgresql',
  database_host     => '127.0.0.1:5432',
  database_name     => 'gitlab',
  database_user     => 'gitlab',
  database_password => 'someultrasecretstuff',
}
````

## Parameter reference

All parameters are documented with puppet-strings. You can view the
markdown-rendered result at [REFERENCE.md](./REFERENCE.md).

## Tests

This module has several unit tests and linters configured. You can execute them
by running:

```sh
bundle exec rake test
```

## Contributions

Contribution is fairly easy:

* Fork the module into your namespace
* Create a new branch
* Commit your bugfix or enhancement
* Write a test for it (maybe start with the test first)
* Create a pull request

Or simply open an issue, maybe someone will have a look into it!

## License and Author

This module was originally written by [Sebastian Rakel](https://github.com/sebastianrakel) and reviewed by my personal puppet guru [Tim Meusel](https://github.com/bastelfreak).
It's licensed with [AGPL version 3](LICENSE).

