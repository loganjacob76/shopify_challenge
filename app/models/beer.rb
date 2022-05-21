class Beer < ApplicationRecord
  validates_presence_of :name
  validates :inventory, presence: true, numericality: true
end