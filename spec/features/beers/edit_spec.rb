require 'rails_helper'

RSpec.describe 'Edit beer page' do
  before :each do
    @beer = create(:random_beer)
    @deleted = create(:random_beer, active: false)

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

    it 'there is a form to delete an active beer' do
      sentence = Faker::Lorem.sentence
      
      fill_in :beer_deletion_comment, with: sentence
      click_on 'Delete Beer'

      expect(current_path).to eq(beer_path(@beer))
      expect(page).to have_content('Beer successfully deleted')
      expect(page).to have_content("Deletion Comment: #{sentence}")
    end
    
    it 'deleted beers have a button to undelete' do
      visit edit_beer_path(@deleted)
      
      expect(page).to have_button('Undelete Beer')
      click_on 'Undelete Beer'
      
      expect(current_path).to eq(beer_path(@deleted))
      expect(page).to have_content('Beer successfully undeleted')
      expect(page).to have_content("Deletion Comment: Undeleted at #{Time.now.strftime('%m/%d/%y')}")
    end
  end
end