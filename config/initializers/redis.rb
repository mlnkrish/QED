require "redis"
puts "#{Rails.configuration.redis_host}"
puts "#{Rails.configuration.redis_port}"
puts "#{Rails.configuration.redis_db}"
$redis = Redis.new(:driver => :hiredis,:host => Rails.configuration.redis_host, :port => Rails.configuration.redis_port, :db => Rails.configuration.redis_db)