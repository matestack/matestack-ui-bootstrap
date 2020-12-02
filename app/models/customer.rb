class Customer < ApplicationRecord
  has_paper_trail

  has_many :orders, dependent: :destroy

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true
  validates :street, presence: :true
  validates :house_number, presence: :true
  validates :postal_code, presence: :true
  validates :city, presence: :true
end
