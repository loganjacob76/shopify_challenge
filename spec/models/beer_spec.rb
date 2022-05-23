require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :inventory }
   it { should validate_numericality_of :inventory }
  end

  describe 'class methods' do
    before :each do
      4.times do
        create(:random_beer)
      end

      create(:random_beer, active: false)
    end

    describe '.in_use' do
      it 'only returns beers that are actively being handled' do
        expect(Beer.in_use.count).to eq(4)
        expect(Beer.all.count).to eq(5)
      end
    end
    
    describe '.deleted' do
      it 'only returns beers that have been deleted' do
        expect(Beer.deleted.count).to eq(1)
        expect(Beer.all.count).to eq(5)
      end
    end
  end
end