require 'rails_helper'

RSpec.describe 'New beer page' do
  context 'When I want to add a new beer to the inventory list' do
    before :each do
      visit new_beer_path
    end

    it 'The form allows me to add one' do
      fill_in :beer_name, with: 'New Beer'
      fill_in :beer_inventory, with: 21
      click_on 'Create Beer'
      
      expect(current_path).to eq(beers_path)

      expect(page).to have_content('New Beer')
      expect(page).to have_content('21 Cases')
      expect(page).to have_content('Beer successfully added')
    end

    it 'attempting to add invalid info generates an error' do
      fill_in :beer_name, with: ''
      fill_in :beer_inventory, with: ''
      click_on 'Create Beer'

      expect(current_path).to eq(new_beer_path)

      expect(page).to have_content("Error: Name can't be blank, Inventory can't be blank, Inventory is not a number")
    end

    it 'there is a cancel button if I decide not to add a beer' do
      click_button 'Cancel'

      expect(current_path).to eq(beers_path)
    end
  end
end