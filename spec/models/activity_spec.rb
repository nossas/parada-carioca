require 'spec_helper'

describe Activity do
  describe ".by_popularity" do
    context "when there is no activity" do
      it { Activity.by_popularity.should be_empty }
    end

    context "when there are activities with different number of attendees" do
      let(:activity1)    { Activity.make! }
      let(:activity2)    { Activity.make! }
      let(:activity3)    { Activity.make! }
      let(:event1)       { Event.make! :activity => activity1 }
      let(:event2)       { Event.make! :activity => activity2 }
      let(:event3)       { Event.make! :activity => activity3 }
      before { 2.times { event1.attendees << User.make! } }
      before { 4.times { event2.attendees << User.make! } }
      before { 3.times { event3.attendees << User.make! } }
      it { Activity.by_popularity.should_not be_empty }
      it("should order activities by most popular") { Activity.by_popularity.should be_== [activity2, activity3, activity1] }
    end
  end
end
