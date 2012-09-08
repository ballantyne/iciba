# Iciba

A command-line/ruby tool to translate chinese using fy.iciba.com

## Installation

Add this line to your application's Gemfile:

    gem 'iciba'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iciba

## Usage

Command-line usage:

    $ fy 'words to be translated'
    
Ruby usage:
    
    require 'iciba'
    Iciba::Fanyi.new('words to be translated')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
