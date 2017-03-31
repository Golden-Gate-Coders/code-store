class Product < ApplicationRecord
  belongs_to :supplier
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products

  validates :name, presence: true, numericality: false

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  validates :stock, numericality: { greater_than: 0 } 
end
