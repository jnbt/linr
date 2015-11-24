module Linr
  class Data
    attr_reader :measurement
    attr_reader :fields
    attr_reader :tags
    attr_reader :timestamp

    def initialize(source)
      @measurement = source.fetch(:measurement)
      @fields      = source.fetch(:fields)
      @tags        = source[:tags]
      @timestamp   = source[:timestamp]
    end
  end
end
