require 'rails_helper'

RSpec.describe 'Edit beer page' do
  before :each do
    @beer = create(:random_beer)

    visit edit_beer_path(@beer)
  end

  describe 'I want to update info on an existing beer' do
    it 'the form is pre-filled with the current info' do
      expect(find_field('Name').value).to have_content(@beer.name)
      expect(find_field('Inventory').value).to have_content(@beer.inventory)
    end

    it 'when I update the info and click submit, I am redirected back to the show page' do
      fill_in :beer_name, with: 'New Name'
      fill_in :beer_inventory, with: 30
      click_on 'Update Beer'

      expect(current_path).to eq(beer_path(@beer))
      expect(page).to have_content('New Name')
      expect(page).to have_content('Cases in inventory - 30')
    end

    it 'when I submit bad info I am sent back to the edit page with an error' do
      fill_in :beer_name, with: ''
      fill_in :beer_inventory, with: ''
      click_on 'Update Beer'

      expect(current_path).to eq(edit_beer_path(@beer))
      expect(page).to have_content("Error: Name can't be blank, Inventory can't be blank, Inventory is not a number")
    end
  end
end