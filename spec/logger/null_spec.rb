require "spec_helper"

describe ::Linr::Logger::Null do
  subject { ::Linr::Logger::Null.new }

  it "does nothing" do
    subject.debug "foo"
    subject.add "bar"
  end
end
