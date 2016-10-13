require "rails_helper"

RSpec.feature "User can create a ticket under project" do
  let!(:user) {FactoryGirl.create(:user)}

  before do
    login_as(user)
    project = FactoryGirl.create(:project, name: "Cherry")
    visit project_path(project)
    click_link "New Ticket"
  end


  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"

    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")
    expect(page).to have_content "Author"
    expect(page).to have_content "#{user.email}"
  end


  scenario "with invalid attributes" do
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end


# bundle exec rspec spec/features/creating_tickets_spec.rb