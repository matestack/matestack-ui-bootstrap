class Person < ApplicationRecord
  has_many :products, dependent: :destroy
end
