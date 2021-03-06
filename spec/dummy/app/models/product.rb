class Product < ApplicationRecord
  has_paper_trail

  has_many :order_items, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true
  validates :price_in_euro, presence: :true
end
