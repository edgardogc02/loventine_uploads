redis_server = Rails.env.development? ? '127.0.0.1' : '88.99.69.71'
redis_database = Rails.env.production? ? '1' : '0'

Sidekiq.configure_server do |config|
  config.server_middleware.remove Sidekiq::Middleware::Server::RetryJobs
  config.redis = { url: "redis://#{redis_server}:6379/#{redis_database}", password: Figaro.env.redis_password }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis_server}:6379/#{redis_database}", password: Figaro.env.redis_password }
end