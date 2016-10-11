require "rails_helper"

RSpec.feature "User can delete a project" do
  before do
    FactoryGirl.create(:project, name: "Apple is a fruit")
    visit "/"
  end

  scenario "Successful" do
    expect(page).to have_content("Apple is a fruit")

    click_link "Delete Project"
    expect(page.current_url).to eq(projects_url)
    expect(page).to have_content("Project Deleted Successfully")
    expect(page).to have_no_content("Apple is a fruit")
  end  
end