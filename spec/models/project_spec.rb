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
		
		it "should downcase name when create a new project" do
			project = Project.create "   worldDomination   "
			project.name.should == "worlddomination"
			project.id.should_not == nil
		end

		it "should raise error when trying to create two projects with the same name" do
			project = Project.create "   worldDomination   "
			expect { Project.create("worldDomination") }.should raise_error(Exceptions::EntityExists)
		end
	end
end