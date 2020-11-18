class Dummy::App < Bootstrap::Apps::Admin

  def brand
    {
      path: root_path,
      text: "Your Rails Backend",
      # img: asset_pack_url("media/images/logos/matestack-logo-orange.png")
    }
  end

  def sidebar_navigation_items
    [
      { type: :transition, path: dummy_dashboard_path, text: "Dashboard", icon: "columns-gap" },
      { type: :transition, path: dummy_products_path, text: "Products", icon: "box" },
      { type: :transition, path: dummy_customers_path, text: "Customers", icon: "people-fill" },
      { type: :transition, path: dummy_orders_path, text: "Orders", icon: "cart-check-fill"},
    ]
  end

  def header_navigation_extra_partial
    span class: "pr-2", text: current_admin.email
    action sign_out_config do
      btn variant: :primary, outline: true, text: "logout"
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

end
