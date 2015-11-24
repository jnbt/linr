module Linr
  module Connection
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

      # Send arbitrary data ober the UDP connection
      # @param data [String]
      def send(data)
        @socket.send(data, SEND_FLAGS)
      end
    end
  end
end
