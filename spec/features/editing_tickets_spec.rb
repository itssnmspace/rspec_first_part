require "rails_helper"

RSpec.feature "Users can edit existing tickets" do  
  let(:user) {FactoryGirl.create(:user)}
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project_id: project.id, user_id: user.id) }

  before do
    visit project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end


  scenario "With valid data" do
    fill_in "Name", with: "Ticket 1"
    fill_in "Description", with: "Ticket 1 description"
    click_button "Update Ticket"

    expect(page).to have_content("Ticket has been updated successfully")
    within("#ticket h2") do
      expect(page).to have_content("Ticket 1")
    end  
  end


  scenario "With invalid data" do
    fill_in "Name", with: ""
    click_button "Update Ticket"
    expect(page).to have_content("Ticket has not been updated")
  end
end 