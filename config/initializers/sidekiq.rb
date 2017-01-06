Sidekiq.configure_server do |config|
  config.server_middleware.remove Sidekiq::Middleware::Server::RetryJobs
  config.redis = { url: Figaro.env.redis_server, password: Figaro.env.redis_password }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Figaro.env.redis_server, password: Figaro.env.redis_password }
end