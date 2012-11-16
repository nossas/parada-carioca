Given /^there is an event called "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  Event.make!(:activity_id => Activity.make!(:name => arg1).id).attendees << arg2.to_i.times
  activity = Activity.make! :name => arg1
  event = Event.make! :activity_id => activity.id
  arg2.to_i.times { event.attendees << User.make! }
end

When(/^I go to "(.*?)"$/)                       { |arg1| visit map(arg1) }
Then(/^the first activity should be "(.*?)"$/)  { |arg1| page.should have_css('.activity:first-child', :text => arg1) }
Then(/^show me the page$/)                      { save_and_open_page }
Then(/^I should see "(.*?)"$/)                  { |arg1| page.should have_content(arg1) }
