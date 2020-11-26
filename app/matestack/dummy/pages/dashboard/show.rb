class Dummy::Pages::Dashboard::Show < Bootstrap::Pages::Admin

  def response
    page_heading_partial title: "Dashboard", subtitle: "Data on this dummy app is generated with the Faker Gem and will be resetted every hour"
    row do
      col md: 6 do
        analytics_partial
      end
      col md: 6 do
        activity_partial
      end
    end
  end

  def analytics_partial
    async defer: 300, id: "revenue-card" do
      dashboard_revenue
    end
    async defer: 600, id: "order-card" do
      dashboard_orders
    end
  end


  def activity_partial
    row do
      col do
        async defer: 900, rerender_on: "activity-tracked", id: "activity-card" do
          dashboard_activity
        end
      end
    end
  end

end
