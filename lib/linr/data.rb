module Linr
  # Describes series send to InfluxDB
  # @see https://influxdb.com/docs/v0.9/guides/writing_data.html
  # @example
  #   Data.new(
  #     measurement: cpu_load_short,
  #     tags: { host: "server01", region: "us-west" },
  #     fields: { value: 0.64 },
  #     timestamp: 1434055562
  #   )
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
