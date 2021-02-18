class OrderItem < ApplicationRecord
  has_paper_trail
  
  belongs_to :order
  belongs_to :product
end
