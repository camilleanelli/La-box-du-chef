class OrderMeal < ActiveRecord::Base
  belongs_to :order
  belongs_to :meal
  monetize :price_cents





end
