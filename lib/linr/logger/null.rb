module Linr
  module Logger
    # A simple null logger without any output
    # @api private
    class Null < ::Logger
      def initialize(*args)
      end

      def add(*args, &block)
      end
    end
  end
end
