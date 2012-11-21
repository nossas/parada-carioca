include ActionView::Helpers::TextHelper

Given /^there is an event called "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:name => arg1)
  arg2.to_i.times { event.attendees << User.make! }
end

Given(/^there is an event called "(.*?)" created (\d+) days ago$/) do |arg1, arg2|
  Event.make! :activity => Activity.make!(:name => arg1), :created_at => Time.now - arg2.to_i.days
end

Then /^the (\d+).* most recent event should be "(.*?)"$/ do |arg1, arg2|
  page.should have_css(".most_recent_events li.event:nth-child(#{arg1})", :text => truncate(arg2, :length => 25))
end

When(/^I go to "(.*?)"$/)                       { |arg1| visit path(arg1) }
Then(/^the first activity should be "(.*?)"$/)  { |arg1| page.should have_css('ol.activities li:first-child', :text => arg1) }
Then(/^show me the page$/)                      { save_and_open_page }
Then(/^I should see "(.*?)"$/)                  { |arg1| page.should have_content(arg1) }
When(/^I click "(.*?)"$/)                       { |arg1| click_link link(arg1) }
Then(/^I should see "(.*?)" component$/)        { |arg1| page.should have_css(component(arg1)) }
Then(/^I should not see "(.*?)" component$/)    { |arg1| page.should_not have_css(component(arg1)) }
