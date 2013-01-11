# coding: utf-8
#
def path path
  return root_path if path == "the homepage"
  return activity_path(@activity) if path == "this activity page"
  return activity_path(@activity, :anchor => "new_review_btn") if path == "the reviews of this activity page"
  return edit_activity_path(Activity.order(:id).last, anchor: :events) if path == "the events page of the new activity"
  return new_activity_path if path == "the new activity page"
  return edit_activity_path(Activity.order(:id).first, anchor: :events) if path == "the events page of this activity"
  return user_participations_path(User.find_by_email("nicolas@engage.is")) if path == "my schedules page"
  return "/users/me/participations" if path == "my activities page"
  raise "I don't know #{path}"
end

def link link
  return "auth_facebook" if link == "the Facebook login button"
  return link
end

def component component
  return ".user_name_and_avatar"  if component == "the user panel"
  return "#auth_facebook"         if component == "the Facebook login"
  raise "I don't know what '#{component}' means"
end

def location location
  if location == "Marina da Glória"
    return {
      :latitude => -22.920097, 
      :longitude => -43.17009, 
      :neighborhood => Neighborhood.find_by_name("Glória")
    }
  elsif location == "Jardim Botânico"
    return {
      :latitude => -22.967126, 
      :longitude => -43.226759,
      :neighborhood => Neighborhood.find_by_name("Jardim Botânico")
    }
  elsif location == "Praça São Salvador"
    return {
      :latitude => -22.93399, 
      :longitude => -43.180604,
      :neighborhood => Neighborhood.find_by_name("Laranjeiras")
    }
  else
    raise "I don't know where is #{location}"
  end
end

def current_path_info
  current_url.sub(%r{.*?://},'')[%r{[/\?\#].*}] || '/'
end
