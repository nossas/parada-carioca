class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def warn_attendees_about_cancellation_of event
    @event = event
    mail(:bcc => event.attendees.map{|a| a.email}.join(","), :subject => "#{event.activity.name} foi cancelada")
  end

  def warn_admin_about_cancellation_of event
    @event = event
    mail(:to => ENV["ADMIN_EMAIL"], :subject => "#{event.activity.name} foi cancelada")
  end
end
