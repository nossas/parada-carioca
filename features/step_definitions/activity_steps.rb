# Place all Activity.make in this file

Given /^there is an activity$/ do
  @activity = Activity.make!
end

Given /^there is an activity called "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:name => arg1)
  arg2.to_i.times { event.attendees << User.make! }
end

Given /^there is an activity called "(.*?)" created (\d+) days ago$/ do |arg1, arg2|
  Activity.make! :name => arg1, :created_at => Time.now - arg2.to_i.days
end

Given /^there is an activity called "(.*?)" in "(.*?)"$/ do |arg1, arg2|
  Activity.make!({:name => arg1, :address => arg2}.merge(location(arg2)))
end


Given /^that I created an activity called "(.*?)" in "(.*?)"$/ do |arg1, arg2|
  Activity.make!({:name => arg1, :address => arg2, guide: User.find_by_email('nicolas@engage.is')}.merge(location(arg2)))
end


Given /^there is an activity of "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:guide => User.find_by_email(arg1))
  arg2.to_i.times { event.attendees << User.make! }
end

Given /^there is an activity in "(.*?)" with (\d+) attendees$/ do |arg1, arg2|
  event = Event.make! :activity => Activity.make!(:neighborhood => Neighborhood.find_by_name(arg1))
  arg2.to_i.times { event.attendees << User.make! }
end

Given /^there is an activity with (\d+) [event|events]+$/ do |arg1|
  @activity = Activity.make!
  Event.make! :activity => @activity
end
