require "rails_helper"

RSpec.feature "User can view the project" do

  before do
    apple = FactoryGirl.create(:project, name: "Apple", description: "This is fruit")
    FactoryGirl.create(:ticket, project_id: apple.id, name: "Ticket for Apple", description: "You are able to purchase Apple")

    potato = FactoryGirl.create(:project, name: "Potato", description: "This is a vegetable")
    FactoryGirl.create(:ticket, project_id: potato.id, name: "Ticket for Potato", description: "You are able to purchase Potato")

    visit "/"
  end

  scenario "For a given project" do
    click_link "Apple"

    STDOUT.puts("Project show page")
    expect(page).to have_content("Ticket for Apple")
    expect(page).to_not have_content("Ticket for Potato")

    click_link "Ticket for Apple"

    STDOUT.puts("Ticket show page")

    within("#ticket h2") do
      expect(page).to have_content("Ticket for Apple")
    end
    expect(page).to have_content("You are able to purchase Apple")
  end
end