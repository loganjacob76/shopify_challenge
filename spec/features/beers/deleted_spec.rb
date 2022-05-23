require 'rails_helper'

RSpec.describe 'Deleted beers index page' do
  before :each do
    @active = create(:random_beer)
    @deleted = create(:random_beer, active: false, deletion_comment: Faker::Lorem.sentence)

    visit deleted_path
  end

  it 'only lists beers that have been deleted' do
    expect(page).to have_link(@deleted.name)
    expect(page).to have_content("#{@deleted.inventory} Cases")

    expect(page).to_not have_content(@active.name)
  end

  it 'has a link to the index of active beers' do
    expect(page).to have_link('Active Beers')
    click_on 'Active Beers'
    expect(current_path).to eq(beers_path)
  end
end