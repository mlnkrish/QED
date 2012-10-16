class Project
	attr_accessor :id, :name, :languages, :frameworks, :vcs

	def initialize(params)
		@id = params["id"]
		@name = params["name"]
		@languages = params["languages"]
		@frameworks = params["frameworks"]
		@vcs = params["vcs"]
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
			frameworks = $redis.smembers "projects:#{id}:frameworks"
			vcs = $redis.smembers "projects:#{id}:vcs"

			project = Project.new({"id" => id, "name" => name, "languages" => languages, "frameworks" => frameworks, "vcs" => vcs})
		end
		project
	end

	def assign_languages(languages)
		$redis.del "projects:#{@id}:languages"
		$redis.sadd "projects:#{@id}:languages",languages
		@languages = $redis.smembers "projects:#{@id}:languages"
	end

	def assign_frameworks(languages)
		$redis.del "projects:#{@id}:frameworks"
		$redis.sadd "projects:#{@id}:frameworks",languages
		@frameworks = $redis.smembers "projects:#{@id}:frameworks"
	end

	def assign_vcs(languages)
		$redis.del "projects:#{@id}:vcs"
		$redis.sadd "projects:#{@id}:vcs",languages
		@vcs = $redis.smembers "projects:#{@id}:vcs"
	end
end