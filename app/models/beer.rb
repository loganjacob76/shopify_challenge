class Beer < ApplicationRecord
  validates_presence_of :name, :active
  validates :inventory, presence: true, numericality: true
end