class Recipe < ActiveRecord::Base
  include Filterable

  mount_uploader :recipe_image, RecipeImageUploader

  belongs_to :category
  has_many :quantities
  has_many :ingredients, through: :quantities

  validates :title, length: { in: 1..100 }


  def self.search(term)
    (Recipe.where("title ILIKE (?)", "%#{term}%").to_a + Recipe.all.select { |r| !r.ingredients.map{|i| i.name}.select{|i| !!i.downcase.match(term.downcase)}.empty?}).uniq
  end
end



