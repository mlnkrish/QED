class Project
	attr_accessor :id, :name, :languages, :frameworks

	def initialize(id,name)
		@id = id
		@name = name
	end

	def self.create(name)
		id = SecureRandom.uuid
		project_name = name.strip
    $redis.hmset "projects:#{id}","id","#{id}","name","#{project_name}"
		$redis.sadd "projects","#{id}"
		Project.new id, project_name
	end

	def self.find_by_id(id)
		project = nil;
		if $redis.exists "projects:#{id}"
			name = $redis.hget "projects:#{id}","name"
			project = Project.new id,name
		end
		project
	end
end