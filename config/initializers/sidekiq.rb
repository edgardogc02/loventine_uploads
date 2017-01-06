Sidekiq.configure_server do |config|
  config.server_middleware.remove Sidekiq::Middleware::Server::RetryJobs
  config.redis = { url: "redis://#{Figaro.env.redis_url}:6379/#{Figaro.env.redis_database}", password: Figaro.env.redis_password }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{Figaro.env.redis_url}:6379/#{Figaro.env.redis_database}", password: Figaro.env.redis_password }
end