CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_KEY'],
      aws_secret_access_key: ENV['S3_SECRET'],
      region:                ENV['S3_REGION']
    }
    config.storage = :fog
    config.fog_directory  = ENV['S3_BUCKET_NAME']
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
end
