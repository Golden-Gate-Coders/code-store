class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_products

  def calculate_subtotal(price, quantity)
    self.subtotal = price * quantity
  end

  def calculate_tax
    self.tax = subtotal * 0.0875
  end

  def calculate_total
    self.total = subtotal + tax
  end


end
