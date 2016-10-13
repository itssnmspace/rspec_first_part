require "rails_helper"

RSpec.feature "User can signout" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
  end

  scenario "signed in user can signout" do
    visit "/"
    expect(page).to have_content("Signed in as #{user.email}")
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end