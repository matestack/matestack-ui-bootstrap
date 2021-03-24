class Dummy::Components::Dashboard::Orders < ApplicationComponent

  def response
    bs_card title: "Orders", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        bs_row do
          bs_col xs: 6 do
            b "Total:"
            plain total
            br
            br
            small "Four weeks ago:"
            small four_weeks_ago
            br
            small "Three weeks ago:"
            small three_weeks_ago
            br
            small "Two weeks ago:"
            small two_weeks_ago
            br
            small "Last 7 days:"
            small last_7_days
          end
          bs_col xs: 6 do
            chart_js type: :line, datasets: [
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
