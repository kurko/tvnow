require "tvnow/show"

describe Tvnow::Show do
  let(:options) do
    { title:       "my title",
      subtitle:    "my subtitle",
      time:        "21:40",
      date:        "13 dez",
      description: "descriptionn",
      period:      "21:40 - 22:40" }
  end

  subject { described_class.new(options) }

  its(:title)       { should == "my title" }
  its(:subtitle)    { should == "my subtitle" }
  its(:time)        { should == "21:40" }
  its(:date)        { should == "13 dez" }
  its(:description) { should == "descriptionn" }
  its(:period)      { should == "21:40 - 22:40" }
end
