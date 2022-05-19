require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :inventory }
   it { should validate_numericality_of :inventory }
   it { should validate_presence_of :active }
  end
end