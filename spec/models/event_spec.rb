require 'spec_helper'

describe Event do
  describe ".available" do
    before do 
      @sold_out_event = Event.make!
      @sold_out_event.maximum_attendees.times { Participation.make! :user => User.make!, :event => @sold_out_event, :moip_status => "4" }
    end
    before { @available_event = Event.make! }
    it("should not include the sold out event") { Event.available.should_not include(@sold_out_event) }
  end
end
