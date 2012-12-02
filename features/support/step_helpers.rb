# coding: utf-8
#
def path path
  return root_path if path == "the homepage"
  return activity_path(@activity) if path == "this activity page"
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
