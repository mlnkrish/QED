class Project
	attr_accessor :id, :name, :languages, :frameworks

	def initialize(params)
		@id = params["id"]
		@name = params["name"]
		@languages = params["languages"]
	end

	def self.create(name)
		id = SecureRandom.uuid
		project_name = name.strip
    $redis.hmset "projects:#{id}","id","#{id}","name","#{project_name}"
		$redis.sadd "projects","#{id}"
		Project.new({"id" => id, "name" => project_name})
	end

	def self.find_by_id(id)
		project = nil;
		if $redis.exists "projects:#{id}"
			name = $redis.hget "projects:#{id}","name"
			languages = $redis.smembers "projects:#{id}:languages"

			project = Project.new({"id" => id, "name" => name, "languages" => languages})
		end
		project
	end

	def assign_languages(languages)
		$redis.del "projects:#{@id}:languages"
		$redis.sadd "projects:#{@id}:languages",languages
		@languages = $redis.smembers "projects:#{@id}:languages"
	end
end