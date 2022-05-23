class Beer < ApplicationRecord
  validates_presence_of :name
  validates :inventory, presence: true, numericality: true

  class << self
    def in_use
      where(active: true)
    end
    
    def deleted
      where(active: false)
    end
  end
end