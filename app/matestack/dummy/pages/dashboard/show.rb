class Dummy::Pages::Dashboard::Show < Bootstrap::Pages::Admin

  include Dummy::Pages::Dashboard::CodeRenderingUtils

  def response
    page_heading title: t("dashboard.title"), subtitle: t("dashboard.subtitle")
    tab_nav tab_nav_config do
      tab_nav_content id: :dummy, active: true do
        dummy_partial
      end
      tab_nav_content id: :matestack_implementation do
        matestack_implementation_partial
      end
      tab_nav_content id: :rails_integration do
        rails_integration_partial
      end
      tab_nav_content id: :javascript_implementation do
        javascript_implementation_partial
      end
      tab_nav_content id: :css_implementation do
        css_implementation_partial
      end
    end
  end

  def tab_nav_config
    {
      id: "navigation",
      items: [
        { id: :dummy, text: "Dummy", active: true},
        { id: :matestack_implementation, text: "Matestack Implementation" },
        { id: :rails_integration, text: "Rails Integration" },
        { id: :javascript_implementation, text: "Required JavaScript" },
        { id: :css_implementation, text: "Required CSS" },
      ],
      variant: :pills,
      vertical_up_to_xl: true,
      class: "mb-5"
    }
  end

  def dummy_partial
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
    async defer: 300, id: "products-card" do
      dashboard_products
    end
    async defer: 600, id: "revenue-card" do
      dashboard_revenue
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
