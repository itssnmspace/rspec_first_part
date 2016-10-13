require "rails_helper"

RSpec.feature "User can signup" do
  scenario "with valid informations" do
    visit "/"

    click_link "Sign up"

    fill_in "Email", with: "snmmaurya@gmail.com"
    fill_in "user_password", with: "snmmaurya"
    fill_in "Password confirmation", with: "snmmaurya"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
end

# bundle exec rspec spec/features/signing_up_spec.rb