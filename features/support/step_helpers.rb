def path path
  return root_path if path == "the homepage"
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
