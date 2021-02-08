class Dummy::App < Bootstrap::Apps::AdminTemplate

  def sidebar_top_partial
    div class: "text-center" do
      transition path: root_path, delay: 300 do
        heading size: 4, text: "Your Rails Backend"
      end
    end
    div class: "text-center my-5" do
      avatar img_path: asset_pack_url('media/images/avatar-placeholder.png')
      div class: "mt-3" do
        plain current_admin.email

      end
      action sign_out_config do
        btn variant: :link, size: :sm, class: "text-muted" do
          bootstrap_icon name: "box-arrow-in-right", size: 25
        end
      end
    end
  end

  def sidebar_navigation_items
    [
      { type: :transition, path: dummy_dashboard_path, text: "Dashboard", icon: "columns-gap" },
      { type: :transition, path: dummy_customers_path, text: "Customers", icon: "people-fill" },
      { type: :transition, path: dummy_orders_path, text: "Orders", icon: "cart-check-fill"},
      { type: :transition, path: dummy_products_path, text: "Products", icon: "box" }
    ]
  end

  # not working right now, please use sidebar only
  # def navbar_items
  #   [
  #     { type: :transition, path: dummy_shared_implementation_path, text: "Shared Implementation"}
  #   ]
  # end

  # not working right now, please use sidebar only
  # def navbar_end_partial
  #   action sign_out_config do
  #     btn variant: :link, size: :lg, class: "text-muted" do
  #       bootstrap_icon name: "box-arrow-in-right", size: 25
  #     end
  #   end
  # end

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
      { show_on: "success", class: "bg-primary text-white", body: "Performed successfully" },
    ]
  end


end
