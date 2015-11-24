require "spec_helper"

describe ::Linr::Data do
  subject { ::Linr::Data }

  it "requires measurement" do
    proc do
      subject.new({})
    end.must_raise KeyError
  end

  it "requires fields" do
    proc do
      subject.new(measurement: "measurement")
    end.must_raise KeyError
  end

  it "allows minimum data" do
    d = subject.new(measurement: "measurement", fields: { some: 12 })
    d.measurement.must_equal "measurement"
    d.fields.must_equal some: 12
  end

  it "allows maximum data" do
    d = subject.new(
      measurement: "measurement",
      fields: { some: 12 },
      tags: { foo: "bar" },
      timestamp: 1_439_587_925
    )
    d.measurement.must_equal "measurement"
    d.fields.must_equal some: 12
    d.tags.must_equal foo: "bar"
    d.timestamp.must_equal 1_439_587_925
  end
end
