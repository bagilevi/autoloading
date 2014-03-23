# Autoloading

Autoload Ruby classes or modules by inferring the file path from the name

## Installation

Add this line to your application's Gemfile:

    gem 'autoloading'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autoloading

## Usage

    # hello.rb
    module Hello
      extend Autoloading
    end

    # hello/kitty.rb
    module Hello::Kitty
    end

    require 'hello'
    Hello::Kitty

## See also

* [application_module gem](https://github.com/bagilevi/application_module)

## Contributing

1. Fork it ( http://github.com/bagilevi/autoloading/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
