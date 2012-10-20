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

		it "should get all project in the system" do
			project1 = Project.create "world domination"
			project2 = Project.create "more world domination"
			all_projects = Project.find_all

			names = all_projects.map do |p|
				p.name
			end

			names.should include("world domination")
			names.should include("more world domination")
		end
	end

	describe "adding technical attributes to aproject" do
		it "should assign languages to a project" do
			project = Project.create "world domination"
			project.assign_languages ['Ruby','Java','C#']

			saved_project = Project.find_by_id project.id
			saved_project.languages.should =~ ['Ruby','Java','C#']
		end

		it "should assign frameworks to a project" do
			project = Project.create "world domination"
			project.assign_frameworks ['Rails','Spring-MVC']

			saved_project = Project.find_by_id project.id
			saved_project.frameworks.should =~ ['Rails','Spring-MVC']
		end

		it "should assign vcs to a project" do
			project = Project.create "world domination"
			project.assign_vcs ['Git','CVS']

			saved_project = Project.find_by_id project.id
			saved_project.vcs.should =~ ['Git','CVS']
		end

		it "should assign build tools to a project" do
			project = Project.create "world domination"
			project.assign_build_tools ['Maven','Gradle']

			saved_project = Project.find_by_id project.id
			saved_project.build_tools.should =~ ['Maven','Gradle']
		end

		it "should assign ci to a project" do
			project = Project.create "world domination"
			project.assign_ci ['Go']

			saved_project = Project.find_by_id project.id
			saved_project.ci.should =~ ['Go']
		end

		it "should assign infrastructure management tools to a project" do
			project = Project.create "world domination"
			project.assign_infrastructure_management_tools ['Puppet','Chef']

			saved_project = Project.find_by_id project.id
			saved_project.infrastructure_tools.should =~ ['Puppet','Chef']
		end
	end
end