require "rails_helper"

RSpec.feature "User can edit the project" do
  before do
    FactoryGirl.create(:project, name: "Apple")
    visit "/"
    click_link "Edit Project"
  end


  scenario "with valid attributes" do
    fill_in "project[name]", with: "Cherry"

    STDOUT.puts "Its being clicked on 'Update Project' button"
    click_button "Update Project"

    STDOUT.puts "Redirected to project show page"
    expect(page).to have_content("Project Updated Successfully")
    expect(page).to have_content("Cherry")
  end


  scenario "With invalid attributes" do
    fill_in "project[name]", with: ""
    click_button "Update Project"
    expect(page).to have_content("Project Has Not Been Updated")
    expect(page).to have_content("Name can't be blank")
  end

end