SpreeBrasil
===========

Gem to add Brazilian Portuguese as a language for Spree.

Installation
------------

Add `spree_brasil` to your Gemfile:

```ruby
gem 'spree_i18n',        github: 'spree/spree_i18n',        branch: '2-1-stable'
gem 'globalize3',        github: 'svenfuchs/globalize3',    branch: 'rails4'
gem 'spree_brasil'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_brasil:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_brasil/factories'
```

Copyright (c) 2013 mcorp, released under the MIT License
