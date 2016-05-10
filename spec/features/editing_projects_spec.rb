require 'rails_helper'
require 'helpers/authentication_helpers'

feature "Editing Projects" do
  before do
    FactoryGirl.create(:project, name: "TextMate 2")
    sign_in_as!(FactoryGirl.create(:admin_user))

    visit "/"
    click_link "TextMate 2"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    fill_in "Name", with: "TextMate 2 beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end

  scenario "Updating a project without a name doesn't update" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end

end