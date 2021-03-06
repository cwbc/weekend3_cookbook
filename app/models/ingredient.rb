class Ingredient < ActiveRecord::Base
  has_many :quantities
  has_many :recipes, through: :quantities

  validates :name, length: { in: 1..50 }


end
