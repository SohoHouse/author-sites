# Author::Sites

If you wanna' write a good book, you've gotta start with a site?

This a gem designed to make including extra sites for author easy

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'author-sites'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install author-sites

## Usage

To use in a fresh Alchemy installation, include the following in your `config/application.rb`

```ruby
module Author
  class Application < Rails::Application
    include Author::Sites::Application
  end
end
```

Then in your new site engine, include the following in your `lib/<engine_name>/engine.rb`

```ruby
module TheNed
  class Engine < ::Rails::Engine
    include Author::Sites.engine
  end
end
```

## TODO

  - Include generator for building new sites

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

