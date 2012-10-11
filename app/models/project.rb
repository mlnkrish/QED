class Project
	attr_accessor :id, :name

	def initialize(id,name)
		@id = id
		@name = name
	end

	def self.create(name)
		id = SecureRandom.uuid
		project_name = name.strip.downcase
		created = $redis.hsetnx "projects", project_name, id
		if created
			Project.new id, project_name
		else
			raise Exceptions::EntityExists
		end
	end
end