require 'rails_helper'

RSpec.feature "UserSearchesMoviesByKeywords", type: :feature do
  scenario "logged user search by keywords" do
    FactoryBot.create :user, email: 'mail@example.com', password: 'password'
    user = { email: 'mail@example.com', password: 'password' }

    visit new_user_session_path

    within "#new_user" do
      fill_in "user_email", with: user[:email]
      fill_in "user_password", with: user[:password]
      click_on "Log in"
    end

    visit search_movies_path(q: 'dark')

    expect(page).to have_current_path(search_movies_path(q: 'dark'))
    expect(page).to have_link("sign out")
    expect(page).to have_link("Home")
    expect(page).to have_text("Search Results")
  end

  # redirects guest users to login page.
  scenario "guest user search by keywords" do
    visit search_movies_path(q: 'dark')

    expect(page).to have_current_path(new_user_session_path)
  end
end
