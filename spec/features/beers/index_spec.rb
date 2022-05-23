require 'rails_helper'

RSpec.describe 'beers index page' do
  before :each do
    4.times do
      create(:random_beer)
    end

    @deleted = create(:random_beer, name: 'NoMore Beer', inventory: 26, active: false)

    visit root_path
  end

  it 'the root path leads to the beers index page' do
    expect(page).to have_content('Beer Inventory')
  end

  it 'only lists beers currently being handled' do    
    expect(page).to have_link(Beer.first.name)
    expect(page).to have_content("#{Beer.first.inventory} Cases")
    expect(page).to have_link(Beer.second.name)
    expect(page).to have_content("#{Beer.second.inventory} Cases")
    expect(page).to have_link(Beer.third.name)
    expect(page).to have_content("#{Beer.third.inventory} Cases")
    expect(page).to have_link(Beer.fourth.name)
    expect(page).to have_content("#{Beer.fourth.inventory} Cases")

    expect(page).to_not have_content(@deleted.name)
    expect(page).to_not have_content(@deleted.inventory)
  end

  it 'has a button to create a new beer record' do
    expect(page).to have_button('Add New Beer')
    click_button 'Add New Beer'
    expect(current_path).to eq(new_beer_path)
  end

  it 'has a link to an index of deleted beers' do
    expect(page).to have_link('Deleted Beers')
    click_on 'Deleted Beers'
    expect(current_path).to eq(deleted_path)
  end
end