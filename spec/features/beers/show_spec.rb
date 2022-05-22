require 'rails_helper'

RSpec.describe 'Beer show page' do
  before :each do
    @beer = create(:random_beer)
    @other_beer = create(:random_beer)

    visit beer_path(@beer)
  end

  describe 'I want to view a specific beer' do
    it 'a link on the index page will take you to the show page' do
      visit root_path

      click_on "#{@beer.name}"
      expect(current_path).to eq(beer_path(@beer))
    end

    it 'the show page has information on only the selected beer' do
      expect(page).to have_content(@beer.name)
      expect(page).to have_content("Cases in inventory - #{@beer.inventory}")

      expect(page).to_not have_content(@other_beer.name)
    end

    it 'There is a button to edit the beer record' do
      expect(page).to have_button('Edit Beer')

      click_button 'Edit Beer'
      expect(current_path).to eq(edit_beer_path(@beer))
    end

    it 'if I decide not to edit the beer there is a link back to the beers index' do
      expect(page).to have_link('Return to List of Beers')
      click_on 'Return to List of Beers'
      expect(current_path).to eq(beers_path)
    end
  end
end