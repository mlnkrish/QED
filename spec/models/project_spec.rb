require "spec_helper"

describe "project" do
	describe "project creation" do
		it "should create a new project" do
			project = Project.create "world domination"
			project.name.should == "world domination"
			project.id.should_not == nil
		end
		
		it "should strip name when create a new project" do
			project = Project.create "   world domination   "
			project.name.should == "world domination"
			project.id.should_not == nil
		end
	end

	describe "finding a project" do
		it "should find project by id" do
			project = Project.create "world domination"

			saved_project = Project.find_by_id project.id
			saved_project.name.should == "world domination"
			saved_project.id.should == project.id
		end

		it "should get nil when project with specified is does not exist" do
			Project.find_by_id("random key").should == nil
		end
	end
end