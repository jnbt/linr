# linr

[![Gem Version](https://badge.fury.io/rb/linr.svg)](https://rubygems.org/gems/linr)
[![Build Status](https://travis-ci.org/jnbt/linr.svg?branch=master)](https://travis-ci.org/jnbt/linr)
[![Coverage Status](https://coveralls.io/repos/jnbt/linr/badge.svg?branch=master)](https://coveralls.io/r/jnbt/linr?branch=master)
[![Code Climate](https://codeclimate.com/github/jnbt/linr/badges/gpa.svg)](https://codeclimate.com/github/jnbt/linr)
[![Gemnasium](https://img.shields.io/gemnasium/jnbt/linr.svg?style=flat)](https://gemnasium.com/jnbt/linr)
[![Inline docs](http://inch-ci.org/github/jnbt/linr.svg?branch=master)](http://inch-ci.org/github/jnbt/linr)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg?style=flat)](http://www.rubydoc.info/github/jnbt/linr/master)

A simple UDP client for [InfluxDB](https://influxdb.com)

## Install

    $ [sudo] gem install linr

Or add it to your Gemfile, etc.

## Usage

Connect to a InfluxDB host via
[UDP](https://influxdb.com/docs/v0.9/write_protocols/udp.html)
and send a series:

```ruby
require "linr"

client = Linr::Client.new(host: "127.0.0.1", port: 8836)
client.write(
 measurement: "cpu_load_short",
 tags: { host: "server01", region: "us-west" },
 fields: { value: 0.64 },
 timestamp: 1434055562
)
```

## References

* [Line Protocol Syntax](https://influxdb.com/docs/v0.9/write_protocols/write_syntax.html)
* [InfluxDB UDP](https://influxdb.com/docs/v0.9/write_protocols/udp.html)

## Testing

Just run

    $ rake


## Contributing

1. Fork it ( https://github.com/jnbt/linr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
