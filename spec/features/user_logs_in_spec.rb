require 'rails_helper'

RSpec.feature "UserLogsIn", type: :feature do
  scenario "user logs in with valid credentials" do
    FactoryBot.create :user, email: 'mail@example.com', password: 'password'
    user = { email: 'mail@example.com', password: 'password' }

    visit new_user_session_path

    within "#new_user" do
      fill_in "user_email", with: user[:email]
      fill_in "user_password", with: user[:password]
      click_on "Log in"
    end

    expect(page).to have_current_path(root_path)
    expect(page).to have_link("sign out")
  end

  scenario "user logs in with invalid credentials" do
    user = { email: 'another_example@mail.com', password: 'examplepass' }
    visit new_user_session_path

    within "#new_user" do
      fill_in "user_email", with: user[:email]
      fill_in "user_password", with: user[:password]
      click_on "Log in"
    end

    expect(page).to have_current_path(new_user_session_path)
  end
end
