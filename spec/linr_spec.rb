require "spec_helper"

describe ::Linr do
  subject { ::Linr }
  it "should hold a version" do
    subject::VERSION.wont_be_nil
  end
end
