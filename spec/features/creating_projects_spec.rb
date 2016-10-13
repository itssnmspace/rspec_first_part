require "rails_helper"

RSpec.feature "User can create a new project" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end
  
  scenario "With valid attributes" do
    visit "/"

    click_link "New Project"
    fill_in "project[name]", with: "Project 1"
    fill_in "project[description]", with: "Project 1 description"
    click_button "Create Project"

    expect(page).to have_content("Project Created Successfully")

    project = Project.last #currently created project

    #Expecting redirecting to the correct path
    expect(page.current_url).to eq(project_url(project))

    #Expecting page title must contains created project name
    expect(page).to have_title "RspecFirstPart - #{project.name}"
  end

  scenario "When proving invalid attributes" do
    visit "/"

    click_link "New Project"
    click_button "Create Project"

    expect(page).to have_content("Project has not been created")
    expect(page).to have_content("Name can't be blank")
  end  
end