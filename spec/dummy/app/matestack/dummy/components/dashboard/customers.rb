class Dummy::Components::Dashboard::Customers < Matestack::Ui::Component

  def response
    bs_card title: "Customers", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        b text: "Total:"
        plain total
        br
        b text: "Last 7 days:"
        plain last_7_days
        br
        b text: "Last 30 days:"
        plain last_30_days
      end
    end
  end

  protected

  def total
    Customer.count
  end

  def last_7_days
    Customer.where("created_at > ?", Time.now - 7.days).count
  end

  def last_30_days
    Customer.where("created_at > ?", Time.now - 30.days).count
  end

end
