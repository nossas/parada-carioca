include ActionView::Helpers::TextHelper

Given /^there is an event called "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:name => arg1)
  arg2.to_i.times { event.attendees << User.make! }
end

Given(/^there is an event called "(.*?)" created (\d+) days ago$/) do |arg1, arg2|
  Event.make! :activity => Activity.make!(:name => arg1), :created_at => Time.now - arg2.to_i.days
end

Then /^the (\d+).* most recent event should be "(.*?)"$/ do |arg1, arg2|
  page.should have_css(".recent_events li.event:nth-child(#{arg1})", :text => truncate(arg2, :length => 25))
end

Given /^there is a guide called "(.*?)" and email "(.*?)"$/ do |arg1, arg2|
  User.make! :first_name => arg1.split[0], :last_name => arg1.split[1], :email => arg2
end

Given /^there is an activity of "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:guide => User.find_by_email(arg1))
  arg2.to_i.times { event.attendees << User.make! }
end

Then /^the (\d+).* most popular guide should be "(.*?)"$/ do |arg1, arg2|
  page.should have_css(".popular_guides li.guide:nth-child(#{arg1})", :text => truncate(arg2, :length => 25))
end

Given /^there is an activity in "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:neighborhood => Neighborhood.find_by_name(arg1))
  arg2.to_i.times { event.attendees << User.make! }
end

Then /^the (\d+).* most popular neighborhood should be "(.*?)"$/ do |arg1, arg2|
  page.should have_css(".popular_neighborhoods li.neighborhood:nth-child(#{arg1})", :text => truncate(arg2, :length => 25))
end

Then(/^show me the page$/)                      { save_and_open_page }
When(/^I go to "(.*?)"$/)                       { |arg1| visit path(arg1) }
Then(/^the first activity should be "(.*?)"$/)  { |arg1| page.should have_css('ol.activities li:first-child', :text => arg1) }
Then(/^I should see "(.*?)"$/)                  { |arg1| page.should have_content(arg1) }
When(/^I click "(.*?)"$/)                       { |arg1| click_link link(arg1) }
Then(/^I should see "(.*?)" component$/)        { |arg1| page.should have_css(component(arg1)) }
Then(/^I should not see "(.*?)" component$/)    { |arg1| page.should_not have_css(component(arg1)) }
