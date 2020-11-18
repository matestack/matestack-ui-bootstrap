class Dummy::Pages::Dashboard::Show < Bootstrap::Pages::Admin

  def response
    page_heading_partial title: "Dashboard"
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
    async defer: 300, rerender_on: "activity-tracked", id: "revenue-card" do
      revenue_card
    end
    async defer: 600, id: "customer-card" do
      customer_card
    end
    async defer: 900, id: "order-card" do
      order_card
    end
  end

  def revenue_card
    card title: "Revenue", class: "shadow-sm mb-3 border-0 h-100 bg-light" do
      div class: "p-3" do
        b text: "Total:"
        plain OrderItem.sum(:price_in_euro).round(2)
        plain "€"
        br
        b text: "Last 7 days:"
        plain OrderItem.where("created_at > ?", Time.now - 7.days).sum(:price_in_euro).round(2)
        plain "€"
        br
        b text: "Last 30 days:"
        plain OrderItem.where("created_at > ?", Time.now - 30.days).sum(:price_in_euro).round(2)
        plain "€"
      end
    end
  end

  def customer_card
    card title: "Customers", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        b text: "Total:"
        plain Customer.count
        br
        b text: "Last 7 days:"
        plain Customer.where("created_at > ?", Time.now - 7.days).count
        br
        b text: "Last 30 days:"
        plain Customer.where("created_at > ?", Time.now - 30.days).count
      end
    end
  end

  def order_card
    card title: "Order", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        b text: "Total:"
        plain Order.count
        br
        b text: "Last 7 days:"
        plain Order.where("created_at > ?", Time.now - 7.days).count
        br
        b text: "Last 30 days:"
        plain Order.where("created_at > ?", Time.now - 30.days).count
      end
    end
  end

  def activity_partial
    row do
      col do
        async defer: 1200, rerender_on: "activity-tracked", id: "activity-card" do
          activity_card
        end
      end
    end
  end

  def activity_card
    card title: "Latest activity", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        PaperTrail::Version.where('whodunnit IS NOT ?', nil).order(:created_at => :desc).limit(10).each do |version|
          div class: "row mb-2" do
            div class: "col-auto pr-0" do
              div class: "rounded-circle bg-primary text-white text-center p-2", attributes: { style: "height: 40px; width: 40px;"} do
                plain Admin.find(version.whodunnit).email.first.upcase if version.whodunnit.present?
              end
            end
            div class: "col" do
              heading size: 6, class: "mb-1", text: Admin.find(version.whodunnit).email if version.whodunnit.present?
              small class: "text-muted mb-0", text: version.event
              small class: "text-muted mb-0", text: "#{version.item_type} #{version.item_id}"
              br
              small class: "text-muted mb-0", text: version.created_at.strftime("%d.%m.%Y")
            end
          end
        end
      end
    end
  end

end
