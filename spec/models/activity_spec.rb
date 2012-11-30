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

  describe "#minimum_attendees" do
    context "when the activity doesn't have any event" do
      before { subject.stub_chain(:events, :any?).and_return(false) }
      its(:minimum_attendees){ should be_nil }
    end

    context "when the lowest value between all events minimum attendees of the activity is 2" do
      before { subject.stub_chain(:events, :any?).and_return(true) }
      before { subject.stub_chain(:events, :minimum).and_return(2) }
      its(:minimum_attendees){ should be_== 2 }
    end
  end

  describe "#maximum_attendees" do
    context "when the activity doesn't have any event" do
      before { subject.stub_chain(:events, :any?).and_return(false) }
      its(:maximum_attendees){ should be_nil }
    end

    context "when the highest value between all events maximum attendees of the activity is 10" do
      before { subject.stub_chain(:events, :any?).and_return(true) }
      before { subject.stub_chain(:events, :maximum).and_return(10) }
      its(:maximum_attendees){ should be_== 10 }
    end
  end

  describe "#duration" do
    context "when the activity doesn't have any event" do
      before { subject.stub_chain(:events, :any?).and_return(false) }
      its(:duration){ should be_nil }
    end

    context "when the average of the events durations is 5 hours" do
      before { subject.stub_chain(:events, :any?).and_return(true) }
      before { subject.stub_chain(:events, :average).and_return(5) }
      its(:duration){ should be_== 5 }
    end
  end
end
