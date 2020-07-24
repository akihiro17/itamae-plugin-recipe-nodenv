# Itamae::Plugin::Recipe::Nodenv [![Build Status](https://travis-ci.org/akihiro17/itamae-plugin-recipe-nodenv.svg?branch=master)](https://travis-ci.org/akihiro17/itamae-plugin-recipe-nodenv)

[Itamae](https://github.com/ryotarai/itamae) plugin to install node with nodenv

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-nodenv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-nodenv

# Usage
## System wide installation

Install nodenv to /usr/local/nodenv or some shared path

### Recipe

```ruby
# your recipe
include_recipe "nodenv::system"
```

### Node

Use this with `itamae -y node.yml`

```yaml
# node.yml
nodenv:
  global:
    12.18.2
  versions:
    - 12.17.0
    - 12.18.2

  # nodenv install dir, optional (default: /usr/local/nodenv)
  nodenv_root: "/path/to/nodenv"

  # specify scheme to use in git clone, optional (default: git)
  scheme: https

  # Create /usr/local/nodenv/cache, optional (default: false)
  # See: https://github.com/nodenv/node-build#custom-build-configuration
  cache: true

  # Whether install dependencies (default: true)
  # Recommend false if `--no-sudo`
  install_dependency: true

  # Install arbitrary nodenv plugins, optional (default: [])
  plugins:
    nodenv/nodenv-aliases:
      revision: master

# node-build is always installed. Specifying revision improves performance.
node-build:
  revision: f38b0efe68154c17bb5dc684c558dd4f424551bf
```

### .bashrc

Recommend to append this to .bashrc in your server.

```bash
export NODENV_ROOT=/usr/local/nodenv
export PATH="${NODENV_ROOT}/bin:${PATH}"
eval "$(nodenv init -)"
```

## Installation for a user

Install nodenv to `~#{node[:nodenv][:user]}/.nodenv`

### Recipe

```ruby
# your recipe
include_recipe "nodenv::user"
```

### Node

Use this with `itamae -y node.yml`

```yaml
# node.yml
nodenv:
  user: akihiro17
  global:
    12.18.2
  versions:
    - 12.17.0
    - 12.18.2

  # specify scheme to use in git clone, optional (default: git)
  scheme: https

  # Create ~/.nodenv/cache, optional (default: false)
  # See: # See: https://github.com/nodenv/node-build#custom-build-configuration
  cache: true

  # Install build dependencies or not (default: true)
  # Recommend false if `--no-sudo`
  install_dependency: true

  # Install arbitrary nodenv plugins, optional (default: [])
  plugins:
    nodenv/nodenv-aliases:
      revision: master

# node-build is always installed. Specifying revision improves performance.
node-build:
  revision: f38b0efe68154c17bb5dc684c558dd4f424551bf
```

## MItamae

This plugin can be used for MItamae too. Put this repository under `./plugins` as git submodule.

```rb
node.reverse_merge!(
  nodenv: {
    user: 'akihiro17',
    global: '12.18.2',
    versions: %w[
      12.18.2
    ],
  }
)

include_recipe "nodenv::user"
```

## License

MIT License
