require "rails_helper"

RSpec.feature "Users can view projects" do

  scenario "with the Gproject details" do

    project = FactoryGirl.create(:project, name: "Project 2")
    #Here :project, name: "Project 2" ==> project is the name of factory and passing name: "name" to create a tuple

    visit "/"

    click_link "Project 2"

    expect(page.current_url).to eq(project_url(project))
  end  

end
