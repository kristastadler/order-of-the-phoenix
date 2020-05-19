require 'rails_helper'

feature "user can search for members of the Order of the Phoenix by House" do
  scenario "user submits a valid house name" do
    visit "/"

    select "Gryffindor", from: :house
    click_on 'Search For Members'
    expect(current_path).to eq("/search")
    expect(page).to have_content("21 Results")
    expect(page).to have_css(".member", count: 21)

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus")
    end

  end
end
