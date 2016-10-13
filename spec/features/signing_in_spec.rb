require "rails_helper"


RSpec.feature "User can singin" do
  let!(:user) {FactoryGirl.create(:user)}

  before do
    visit "/"
  end  

  scenario "with valid information" do
    click_link "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{user.email}")
  end

  scenario "with invallid information" do
    click_link "Sign in"
    
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Sign in"

    expect(page).to have_content("Invalid email or password.")
  end  
end  