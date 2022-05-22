require 'rails_helper'

RSpec.describe 'beers index page' do
  before :each do
    4.times do
      create(:random_beer)
    end

    @deleted = create(:random_beer, name: 'Deleted Beer', inventory: 4, active: false)
  end

  it 'the root path leads to the beers index page' do
    visit root_path

    expect(page).to have_content('Beer Inventory')
  end

  it 'only lists beers currently being handled' do
    visit root_path
    
    expect(page).to have_content(Beer.first.name)
    expect(page).to have_content("#{Beer.first.inventory} Cases")
    expect(page).to have_content(Beer.second.name)
    expect(page).to have_content("#{Beer.second.inventory} Cases")
    expect(page).to have_content(Beer.third.name)
    expect(page).to have_content("#{Beer.third.inventory} Cases")
    expect(page).to have_content(Beer.fourth.name)
    expect(page).to have_content("#{Beer.fourth.inventory} Cases")

    expect(page).to_not have_content(@deleted.name)
    expect(page).to_not have_content(@deleted.inventory)
  end
end