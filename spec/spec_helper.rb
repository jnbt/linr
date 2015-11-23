$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "coveralls"
Coveralls.wear!

require "linr"

require "minitest/autorun"
