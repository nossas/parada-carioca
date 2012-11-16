require 'spec_helper'

describe Event do
  describe ".by_popularity" do
    context "when there is no event" do
      it { Event.by_popularity.should be_empty }
    end

    context "when there are events with different number of attendees" do
      let(:event1)    { Event.make! }
      let(:event2)    { Event.make! }
      let(:event3)    { Event.make! }
      before { 2.times { event1.attendees << User.make! } }
      before { 4.times { event2.attendees << User.make! } }
      before { 3.times { event3.attendees << User.make! } }
      it { Event.by_popularity.should_not be_empty }
      it("should order events by most popular") { Event.by_popularity.should be_== [event2, event3, event1] }
    end
  end
end
