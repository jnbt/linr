require "spec_helper"

describe ::Linr::Connection::UDP do
  subject      { ::Linr::Connection::UDP.new(host, port) }
  let(:host)   { "127.0.0.1" }
  let(:port)   { 44_000 }
  let(:socket) { UDPSocket.new }

  before do
    socket.bind(host, port)
  end

  it "sends data as passed" do
    payload = "measurement,foo=bar,bat=baz value=12,otherval=21 1439587925"
    subject.send(payload)
    socket.recvfrom(60).first.must_equal payload
  end
end
