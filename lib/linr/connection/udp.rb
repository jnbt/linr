module Linr
  module Connection
    # Connects to a InfluxDB UDP port
    # @see https://influxdb.com/docs/v0.9/write_protocols/udp.html
    # @example
    #   UDP.new("localhost", 8089).send("series a=0.51")
    class UDP
      # Use non-custom flags
      SEND_FLAGS = 0

      # Establishes a connection
      # @param host [String]
      # @param port [Fixnum]
      def initialize(host, port)
        @socket = UDPSocket.new
        @socket.connect(host, port)
      end

      # Send data over the UDP connection. Should be encoded using the Line
      # Protocol.
      # @see Encoder::Line
      # @param data [String]
      def send(data)
        @socket.send(data, SEND_FLAGS)
      end
    end
  end
end
