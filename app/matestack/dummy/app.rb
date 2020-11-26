class Dummy::App < Bootstrap::Apps::Admin

  def sidebar_top_partial
    div class: "text-center" do
      transition path: root_path, delay: 300 do
        heading size: 4, text: "Your Rails Backend"
        # img height: 40, path: asset_pack_url("media/images/logos/matestack-logo-orange.png")
      end
    end
    div class: "text-center my-5" do
      div class: "rounded-circle bg-primary text-white text-center p-2", attributes: { style: "display: inline-block; height: 40px; width: 40px;"} do
        plain current_admin.email.first.upcase
      end
      div class: "my-3" do
        plain current_admin.email
      end
    end
  end

  def sidebar_navigation_items
    [
      { type: :transition, path: dummy_dashboard_path, text: "Dashboard", icon: "columns-gap" },
      { type: :transition, path: dummy_products_path, text: "Products", icon: "box" },
      { type: :transition, path: dummy_customers_path, text: "Customers", icon: "people-fill" },
      { type: :transition, path: dummy_orders_path, text: "Orders", icon: "cart-check-fill"},
    ]
  end

  # def navbar_items
  #   [
  #     { type: :transition, path: dummy_dashboard_path, icon: "columns-gap"},
  #     { type: :transition, path: dummy_products_path, icon: "box" },
  #     { type: :transition, path: dummy_customers_path, icon: "people-fill" },
  #     { type: :transition, path: dummy_orders_path, icon: "cart-check-fill"},
  #   ]
  # end
  #
  # def navbar_brand_config
  #   {
  #     text: "Your Rails Backend"
  #   }
  # end

  def navbar_end_partial
    action sign_out_config do
      btn variant: :link, size: :lg, class: "text-muted" do
        bootstrap_icon name: "box-arrow-in-right", size: 25
      end
    end
  end

  def sign_out_config
    {
       method: :get,
       path: destroy_admin_session_path,
       success: {
         redirect: {
           follow_response: true
         }
       }
    }
  end

  def toasts
    [
      { show_on: "failure", class: "bg-danger text-white", body: "{{ eventData.message }}".html_safe },
      { show_on: "success", class: "bg-primary text-white", body: "Performed successfully".html_safe },
    ]
  end

  # def content_background_class
  #   "bg-white"
  # end

end
