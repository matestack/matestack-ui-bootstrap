class Dummy::ProductKpiService

  def self.top_5_products
    OrderItem
      .group(:product_id)
      .sum(:price_in_euro)
      .sort_by{|k, v| v}
      .reverse
      .first(5)
  end

  def self.top_5_product_values
    self.top_5_products
      .map { |product_id, value| value }
  end

  def self.top_5_product_names
    self.top_5_products
      .map { |product_id, value| Product.find(product_id).name }
  end

end
