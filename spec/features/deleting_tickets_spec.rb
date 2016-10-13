require "rails_helper"

RSpec.feature "Tickets can be deleted" do
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project_id: project.id) }

  before do
    visit project_ticket_path(project, ticket)
  end

  scenario "Successfuly Deleted" do
    click_link "Delete Ticket"


    expect(page).to have_content("Ticket Deleted Successfuly")
    expect(page.current_url).to eq(project_url(project))
  end
end  