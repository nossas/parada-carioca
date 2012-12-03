require 'spec_helper'

describe Event do
  describe ".available" do
    before do 
      @sold_out_event = Event.make!
      @sold_out_event.maximum_attendees.times { @sold_out_event.attendees << User.make! }
    end
    before { @available_event = Event.make! }
    it("should not include the sold out event") { Event.available.should_not include(@sold_out_event) }
  end
end
