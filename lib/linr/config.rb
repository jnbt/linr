module Linr
  # Holds the config of a {Client}
  # @example
  #   Config.new(host: "db.domain.com", logger: Logger.new($stdout))
  class Config
    attr_reader :host
    attr_reader :port
    attr_reader :logger
    attr_reader :encoder

    # Build a config based on opts
    # @param opts [Hash] the options to create the config
    # @option opts [String] :host
    # @option opts [Fixnum] :port
    # @option opts [::Logger] :logger
    # @option opts [Object] :encoder
    def initialize(opts = {})
      @host    = opts.fetch(:host, "127.0.0.1")
      @port    = opts.fetch(:port, 8089)
      @logger  = opts.fetch(:logger, Logger::Null.new)
      @encoder = opts.fetch(:encoder, Encoder::Line.new)
    end
  end
end
