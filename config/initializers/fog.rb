CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                       
    :aws_access_key_id      => "#{ENV['AWSACCESSKEY']}",                     
    :aws_secret_access_key  => "#{ENV['AWSSECRETKEY']}",               
    :region                 => 'eu-west-1'                 
  }

  config.fog_directory  = 'smfirstbucket'                  
end