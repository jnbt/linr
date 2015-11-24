require "spec_helper"

describe ::Linr::Encoder::Line do
  subject      { ::Linr::Encoder::Line.new }
  let(:data)   { ::Linr::Data.new(source)  }
  let(:output) { subject.dump(data) }

  describe "whitespace" do
    let(:source) do
      {
        measurement: "A test measurement",
        fields: { "some long field" => 5 },
        tags: { "some tag" => "with whitespace" },
        timestamp: 123_456_789
      }
    end

    it "escapes" do
      expected =  'A\ test\ measurement'
      expected << ',some\ tag=with\ whitespace'
      expected << ' some\ long\ field=5i'
      expected << " 123456789"
      output.must_equal expected
    end
  end

  describe "commas" do
    let(:source) do
      {
        measurement: "A,test,measurement",
        fields: { "some,long,field" => 5 },
        tags: { "some,tag" => "with,comma" },
        timestamp: 123_456_789
      }
    end

    it "escapes" do
      expected =  'A\,test\,measurement'
      expected << ',some\,tag=with\,comma'
      expected << ' some\,long\,field=5i'
      expected << " 123456789"
      output.must_equal expected
    end
  end

  describe "minimum data" do
    let(:source) do
      {
        measurement: "series",
        fields: { "field" => 0.51 }
      }
    end

    it "dumps" do
      output.must_equal "series field=0.51"
    end
  end

  describe "complex data types" do
    let(:source) do
      {
        measurement: "series",
        fields: { A: true, B: false, C: 'A"B', D: 5, E: 1.1 }
      }
    end

    it "dumps" do
      output.must_equal 'series A=true,B=false,C="A\"B",D=5i,E=1.1'
    end
  end
end
