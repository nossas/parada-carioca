def map path
  return root_path if path == "the homepage"
  raise "I don't know #{path}"
end
