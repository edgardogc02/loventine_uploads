CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Figaro.env.aws_access_key_id,
    aws_secret_access_key: Figaro.env.aws_secret_access_key,
    region: Figaro.env.aws_region, # optional, defaults to 'us-east-1'
  }
  config.fog_authenticated_url_expiration = 31_536_000 # one year
  config.fog_directory  = Figaro.env.fog_directory # required
  config.fog_public     = false # optional, defaults to true
  config.fog_authenticated_url_expiration = 604_800
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000', ssl_version: :TLSv1_2 } # optional, defaults to {}
end