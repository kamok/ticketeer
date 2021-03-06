require 'rails_helper'

feature "Signing in" do
  scenario 'Signing in via form' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_link 'Sign in'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    fill_in 'Email', with: user.email
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end