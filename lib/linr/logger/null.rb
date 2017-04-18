require "logger"

module Linr
  module Logger
    # A simple null logger without any output
    # @api private
    class Null < ::Logger
      def initialize(*_args); end

      def add(*_args, &_block); end
    end
  end
end
