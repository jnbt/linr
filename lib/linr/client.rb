module Linr
  # Simple UDP-based InfluxDB client
  # @example
  #   client = Client.new(host: "127.0.0.1", port: 8063)
  #   client.write(
  #     measurement: "cpu_load_short",
  #     tags: { host: "server01", region: "us-west" },
  #     fields: { value: 0.64 },
  #     timestamp: 1434055562
  #   )
  class Client
    attr_reader :config

    # Initialize a new client.
    # @param opts [Hash] See {Config} for opts
    # @see Config
    def initialize(opts = {})
      @config = Config.new(opts)
      connect!
    end

    # Write one or more series to the InfluxDB connection
    # @param series [Array<Hash>] see {Data} for values
    def write(*series)
      payload = build_payload(series)
      send(payload)
    end

    private

    def connect!
      @connection = Connection::UDP.new(config.host, config.port)
      info("Connected to #{config.host}:#{config.port}")
    end

    def build_payload(series)
      series.map do |serie|
        data = Data.new(serie)
        encode(data)
      end.join("\n")
    end

    def send(payload)
      debug(payload)
      @connection.send(payload)
    end

    def encode(data)
      config.encoder.dump(data)
    end

    def info(matter)
      config.logger.info("Linr") { matter }
    end

    def debug(matter)
      config.logger.debug("Linr") { matter }
    end
  end
end
