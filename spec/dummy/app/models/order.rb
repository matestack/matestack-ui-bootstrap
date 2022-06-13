class Order < ApplicationRecord
  has_paper_trail

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum status: [:open, :prepare_for_delivery, :delivered]

  acts_as_list scope: [:status]

  def price_in_euro
    order_items.pluck(:price_in_euro).inject(0){|sum,x| sum + x }.round(2)
  end

  def shipped_at_humanize
    shipped_at.strftime("%d.%m.%Y")
  end

  def shipped_at_date_humanize
    shipped_at.to_date.strftime("%d.%m.%Y")
  end
end
