require 'spec_helper'

describe "Images" do
	describe "when editing a project" do 

	 	before(:each) do
	 		@user = setup_signed_in_user
	 		@project = FactoryGirl.create :project, user: @user
	 	end

	 	it "should succesfully upload an image for my project" do
	 		visit edit_my_project_path(@project)

	 		page.should have_link('Manage Images')
	 		click_link 'Manage Images'

	 		page.should have_no_selector('.image')
	 		expect(page).to have_no_selector('.image')

	 		path = File.join(Rails.root, 'app', 'assets', 'images', "rails.png")
	 		attach_file("image[file]", path)
	 		click_button("Upload Image")

	 		page.should have_selector('.image', count: 1)
	 		expect(page).to have_selector('.image', count: 1)
	 	end

	 	it "should fail to upload an image for my project", :focus => true do


	 		visit my_project_images_path(@project)

	 		path = File.join(Rails.root, 'app', 'assets', 'javascripts', 'application.js')
	 		attach_file("image[file]", path)
	 		click_button("Upload Image")

	 		page.should have_content('not allowed')
	 		expect(page).to have_content('not allowed')

	 		page.should have_no_selector('.image')
	 		expect(page).to have_no_selector('.image')
	 	end
	end
end
