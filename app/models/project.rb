class Project
	attr_reader :id, :name, :languages, :frameworks, :vcs, :build_tools, :ci, :infrastructure_tools

	def initialize(params)
		@id = params["id"]
		@name = params["name"]
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
			project = Project.new({"id" => id, "name" => name})
		end
		project
	end

	def self.find_all
		all_projects_id = $redis.smembers "projects"
		all_projects_id.map do |id|
			Project.find_by_id id
		end 
	end

	def rget(attribute)
		$redis.smembers "projects:#{@id}:"+attribute
	end

	def languages
		if(@languages.nil?)
			@languages = rget "languages"
		end
		@languages
	end

	def frameworks
		if(@frameworks.nil?)
			@frameworks = rget "frameworks"
		end
		@frameworks
	end

	def vcs
		if(@vcd.nil?)
			@vcs = rget "vcs"
		end
		@vcs
	end

	def ci
		if(@ci.nil?)
			@ci = rget "ci"
		end
		@ci
	end

	def build_tools
		if(@build_tools.nil?)
			@build_tools = rget "build-tools"
		end
		@build_tools
	end

	def infrastructure_tools
		if(@infrastructure_tools.nil?)
			@infrastructure_tools = rget "infrastructure-tools"
		end
		@infrastructure_tools
	end

	def assign_languages(languages)
		$redis.del "projects:#{@id}:languages"
		$redis.sadd "projects:#{@id}:languages",languages
		@languages = $redis.smembers "projects:#{@id}:languages"
	end

	def assign_frameworks(frameworks)
		$redis.del "projects:#{@id}:frameworks"
		$redis.sadd "projects:#{@id}:frameworks",frameworks
		@frameworks = $redis.smembers "projects:#{@id}:frameworks"
	end

	def assign_vcs(vcs)
		$redis.del "projects:#{@id}:vcs"
		$redis.sadd "projects:#{@id}:vcs",vcs
		@vcs = $redis.smembers "projects:#{@id}:vcs"
	end

	def assign_build_tools(build_tools)
		$redis.del "projects:#{@id}:build-tools"
		$redis.sadd "projects:#{@id}:build-tools",build_tools
		@build_tools = $redis.smembers "projects:#{@id}:build-tools"
	end

	def assign_ci(ci)
		$redis.del "projects:#{@id}:ci"
		$redis.sadd "projects:#{@id}:ci",ci
		@ci = $redis.smembers "projects:#{@id}:ci"
	end

	def assign_infrastructure_management_tools(infrastructure)
		$redis.del "projects:#{@id}:infrastructure-tools"
		$redis.sadd "projects:#{@id}:infrastructure-tools",infrastructure
		@infrastructure = $redis.smembers "projects:#{@id}:infrastructure-tools"
	end
end