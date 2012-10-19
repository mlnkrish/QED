class Project
	attr_reader :id, :name, :languages, :frameworks, :vcs, :build_tools,
							:ci, :infrastructure_tools, :operating_system, 
							:off_the_shelf_products, :cloud_usage

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


	# Will do some fancy meta-programming to remove all this nonsense
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

	def operating_system
		if(@operating_system.nil?)
			@operating_system = rget "operating-system"
		end
		@operating_system
	end

	def off_the_shelf_products
		if(@off_the_shelf_products.nil?)
			@off_the_shelf_products = rget "products"
		end
		@off_the_shelf_products
	end

	def cloud_usage
		if(@cloud_usage.nil?)
			@cloud_usage = rget "cloud-usage"
		end
		@cloud_usage
	end


	def rset(attribute,value)
		key = "projects:#{@id}:"+attribute
		$redis.del key
		$redis.sadd key,value
		$redis.smembers key
	end

	def assign_languages(languages)
		@languages = rset "languages",languages
	end

	def assign_frameworks(frameworks)
		@frameworks = rset "frameworks",frameworks
	end

	def assign_vcs(vcs)
		@vcs = rset "vcs",vcs
	end

	def assign_build_tools(build_tools)
		@build_tools = rset "build-tools",build_tools
	end

	def assign_ci(ci)
		@ci = rset "ci",ci
	end

	def assign_infrastructure_management_tools(infrastructure)
		@infrastructure = rset "infrastructure-tools",infrastructure
	end

	def assign_operating_system(operating_system)
	  @operating_system = rset "operating-system", operating_system
	end

	def assign_off_the_shelf_products(products)
	  @off_the_shelf_products = rset "products",products
	end

	def assign_cloud_usage(cloud_usage)
	  @cloud_usage = rset "cloud-usage",cloud_usage
	end
end