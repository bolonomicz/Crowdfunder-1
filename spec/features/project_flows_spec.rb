require 'spec_helper'

describe "Project Listing" do
	describe "when visiting the index page" do
		it "should display all projects" do

			project1 = FactoryGirl.create(:project, :title => "Project 1")
			project2 = FactoryGirl.create(:project, :title => "Project 2")
			project3 = FactoryGirl.create(:project, :title => "Project 3")

			visit "/projects"
			expect(current_path).to eq(projects_path)

			page.should have_content("Listing projects")
			expect(page).to have_content("Listing projects")

			page.should have_content("Project 1")
			expect(page).to have_content("Project 1")

			page.should have_content("Project 2")
			expect(page).to have_content("Project 2")

			page.should have_content("Project 3")
			expect(page).to have_content("Project 3")

		end
	end
end

