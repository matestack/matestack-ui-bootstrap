class Dummy::Components::Dashboard::Orders < Matestack::Ui::Component

  def response
    card title: "Orders", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        row do
          col xs: 6 do
            b text: "Total:"
            plain total
            br
            br
            small text: "Four weeks ago:"
            small text: four_weeks_ago
            br
            small text: "Three weeks ago:"
            small text: three_weeks_ago
            br
            small text: "Two weeks ago:"
            small text: two_weeks_ago
            br
            small text: "Last 7 days:"
            small text: last_7_days
          end
          col xs: 6 do
            chart type: :line, datasets: [
              {
                label: "Orders",
                data: [four_weeks_ago, three_weeks_ago, two_weeks_ago, last_7_days],
                borderColor: :primary,
                pointRadius: 0
              },
            ], labels: ["4 weeks ago", "3 weeks ago", "2 weeks ago", "last 7 days"], display_x_axes: false, display_y_axes: false
          end
        end
      end
    end
  end

  protected

  def total
    Order.count
  end

  def last_7_days
    Order.where(created_at: Time.now-7.days..Time.now).count
  end

  def two_weeks_ago
    Order.where(created_at: Time.now-14.days..Time.now-7.days).count
  end

  def three_weeks_ago
    Order.where(created_at: Time.now-21.days..Time.now-14.days).count
  end

  def four_weeks_ago
    Order.where(created_at: Time.now-28.days..Time.now-21.days).count
  end

end
