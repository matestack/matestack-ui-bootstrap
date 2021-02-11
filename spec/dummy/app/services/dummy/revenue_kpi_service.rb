class Dummy::RevenueKpiService

  def self.total
    OrderItem
      .sum(:price_in_euro)
      .round(2)
  end

  def self.last_7_days
    OrderItem
      .where(created_at: Time.now-7.days..Time.now)
      .sum(:price_in_euro)
      .round(2)
  end

  def self.two_weeks_ago
    OrderItem
      .where(created_at: Time.now-14.days..Time.now-7.days)
      .sum(:price_in_euro)
      .round(2)
  end

  def self.three_weeks_ago
    OrderItem
      .where(created_at: Time.now-21.days..Time.now-14.days)
      .sum(:price_in_euro)
      .round(2)
  end

  def self.four_weeks_ago
    OrderItem
      .where(created_at: Time.now-28.days..Time.now-21.days)
      .sum(:price_in_euro)
      .round(2)
  end

end
