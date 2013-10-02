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

			click_link('Project 1')

			expect(current_path).to eq(project_path(project1))
			page.should have_selector('h1:first', text: project1.title)

		end

		it "should display the navigation" do
			project1 = FactoryGirl.create(:project, :title => "Project 1")
			visit "/"

			expect(current_path).to eq(root_path)

			page.should have_selector('.navbar ul li.active a', text: "Home")
			expect(page).to have_selector('.navbar ul li.active a', text: "Home")

			page.find('.navbar ul').click_link("Projects")
			expect(current_path).to eq(projects_path)

			page.should have_selector('.navbar ul li.active a', text: "Projects")
			expect(page).to have_selector('.navbar ul li.active a', text: "Projects")

			click_link 'Project 1'
			page.should have_selector('.navbar ul li.active a', text: 'Projects')
			expect(page).to have_selector('.navbar ul li.active a', text: 'Projects') 

			page.should have_selector('.navbar ul li.active a', count: 1)
      expect(page).to have_selector('.navbar ul li.active a', count: 1)

		end
	end
end
		
	

