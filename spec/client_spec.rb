require "spec_helper"

describe ::Linr::Client do
  subject      { ::Linr::Client.new(config) }
  let(:config) do
    { port: port, logger: logger }
  end
  let(:logger) do
    ::Logger.new(output).tap { |l| l.level = Logger::DEBUG }
  end
  let(:output) { StringIO.new }
  let(:socket) { UDPSocket.new }
  let(:port)   { 44_001 }

  before do
    socket.bind("127.0.0.1", port)
  end

  after do
    socket.close
  end

  it "holds a config" do
    subject.config.logger.must_equal logger
  end

  it "writes a single series to socket" do
    subject.write(measurement: "m", fields: { a: 1.0 })
    socket.recvfrom(60).first.must_equal "m a=1.0"
  end

  it "writes multiple series to socket" do
    serie1 = { measurement: "m", fields: { a: 1.0 } }
    serie2 = { measurement: "n", fields: { b: true }, timestamp: 1_234_567 }
    subject.write(serie1, serie2)

    socket.recvfrom(80).first.must_equal "m a=1.0\nn b=true 1234567"
  end

  it "logs payloads" do
    subject.write(measurement: "m", fields: { a: 1.0 })
    lines = output.string.split("\n")
    lines.size.must_equal 2
    lines.shift.must_match(/Connected to 127\.0\.0\.1:44001/)
    lines.shift.must_match("m a=1")
  end
end
