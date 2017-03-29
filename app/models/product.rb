class Product < ApplicationRecord
  belongs_to :supplier

  has_many :categorized_products
  has_many :categories, through: :categorized_products
end
