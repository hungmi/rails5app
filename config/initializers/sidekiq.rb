# rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
# rails_env = Rails.env || 'development'
# redis_config = YAML.load_file(rails_root.to_s + '/config/redis.yml')
# redis_config.merge! redis_config.fetch(Rails.env, {})
# redis_config.symbolize_keys!
Sidekiq.configure_server do |config|
	config.redis = { url: "redis://#{ENV['REDIS_URL']}:#{ENV['REDIS_PORT']}/12" }
end
Sidekiq.configure_client do |config|
	config.redis = { url: "redis://#{ENV['REDIS_URL']}:#{ENV['REDIS_PORT']}/12" }
end