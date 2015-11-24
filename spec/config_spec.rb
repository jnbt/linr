require "spec_helper"

describe ::Linr::Config do
  describe "no options" do
    subject { ::Linr::Config.new }

    it "has defaults" do
      subject.host.must_equal "127.0.0.1"
      subject.port.must_equal 8089
    end
  end

  describe "with options" do
    subject { ::Linr::Config.new(options) }

    describe "minimal options" do
      let(:options) { {} }

      it "has defaults" do
        subject.host.must_equal "127.0.0.1"
        subject.port.must_equal 8089
      end
    end

    describe "maximal options" do
      let(:options) do
        {
          host: "localhost",
          port: 1337,
          logger: logger
        }
      end
      let(:logger) { Logger.new($stdout) }

      it "holds config" do
        subject.host.must_equal "localhost"
        subject.port.must_equal 1337
        subject.logger.must_equal logger
      end
    end
  end
end
