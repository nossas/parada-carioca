CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["AWS_ID"],
    :aws_secret_access_key  => ENV["AWS_SECRET"],
  }
  config.fog_directory  = 'parada-carioca' 
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
