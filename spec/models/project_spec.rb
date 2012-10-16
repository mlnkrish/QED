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

	describe "adding language to project" do
		it "should assign languages to a project" do
			project = Project.create "world domination"
			project.assign_languages ['Ruby','Java','C#']

			saved_project = Project.find_by_id project.id
			saved_project.languages.should =~ ['Ruby','Java','C#']
		end
	end

	describe "adding frameworks to project" do
		it "should assign languages to a project" do
			project = Project.create "world domination"
			project.assign_frameworks ['Rails','Spring-MVC']

			saved_project = Project.find_by_id project.id
			saved_project.frameworks.should =~ ['Rails','Spring-MVC']
		end
	end

	describe "adding vcs to project" do
		it "should assign languages to a project" do
			project = Project.create "world domination"
			project.assign_vcs ['Git','CVS']

			saved_project = Project.find_by_id project.id
			saved_project.vcs.should =~ ['Git','CVS']
		end
	end
end