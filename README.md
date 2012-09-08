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
    $ fy 'english' # for single word answers
    $ fy 'english' -e for complete definition if available
    $ fy http://www.chinadaily.com.cn/business/2012-09/07/content_15742188.htm -l
    
Ruby usage:
    
    require 'iciba'
    Iciba::Fanyi.new('words to be translated')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
