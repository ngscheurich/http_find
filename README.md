# HTTP Find 

[![Build Status](https://travis-ci.org/ngscheurich/http_find.svg?branch=master)](https://travis-ci.org/ngscheurich/http_find)
[![Coverage Status](https://coveralls.io/repos/github/ngscheurich/http_search/badge.svg?branch=master)](https://coveralls.io/github/ngscheurich/http_search?branch=master)

Searches the contents of an HTTP response for a specified term or pattern.

[![asciicast](https://asciinema.org/a/0kglco19bheo0wky86l0jmoul.png)](https://asciinema.org/a/0kglco19bheo0wky86l0jmoul?size=medium&autoplay=true&loop=true)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "http_find"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_find

Installing this gem will add the executable `httpfind` to your system.

## Usage

With `httpfind` in your $PATH, usage looks like:

```
$ httpfind [options] URI TERM
```

This will search the HTTP GET response from `URI` for the specified `TERM`.

`TERM` may be either a simple string or a regular expression in the form
`$ httpfind -e http://example.com '\d.{2} one'` (note the `-e` option).
Check `$httpfind --help` for more info.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/ngscheurich/http_find. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

