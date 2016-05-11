module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/signin'
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
  end

  RSpec.configure do |c|
    c.include AuthenticationHelpers
  end
end

module AuthHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end

  RSpec.configure do |c|
  c.include AuthHelpers, type: :controller
  end
end

