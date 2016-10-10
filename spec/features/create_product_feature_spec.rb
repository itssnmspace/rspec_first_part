require "rails_helper"

RSpec.feature "User can create a new project" do
  scenario "With valid attributes" do
    visit "/"

    click_link "New Project"
    fill_in "project[name]", with: "Project 1"
    fill_in "project[description]", with: "Project 1 description"
    click_button "Create Project"

    expect(page).to have_content("Project Created Successfully")
  end
end