class Beer < ApplicationRecord
  validates_presence_of :name
  validates :inventory, presence: true, numericality: true

  def self.in_use
    where(active: true)
  end
end