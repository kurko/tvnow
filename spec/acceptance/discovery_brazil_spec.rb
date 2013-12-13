require "spec_helper"

describe Tvnow::ChannelPages::DiscoveryBrazil do
  describe "#schedule" do
    subject { Tvnow::Channel.new(:discovery, :brazil).schedule(period) }

    describe "today" do
      let(:period) { :today }

      it "returns the schedule with titles" do
        subject.map(&:title).all? { |str| str.length > 0 }.should be_true
      end

      it "returns the schedule with times" do
        subject.map(&:time).all?  { |str| str =~ /[0-9]{2}:[0-9]{2}/ }.should be_true
      end
    end
  end
end
