class Bootstrap::App < Bootstrap::Apps::Admin

  def brand
    {
      path: dashboard_path,
      text: "Your Brand here",
      # img: asset_pack_url("media/images/logos/matestack-logo-orange.png")
    }
  end

  def header_navigation_items
    [
      { type: :transition, path: dashboard_path, text: "Link 1" },
      { type: :transition, path: form_path, text: "Link 2" },
      { type: :link, path: "https://google.de", text: "Link 3", variant: :primary }
    ]
  end

  def sidebar_navigation_items
    [
      { type: :transition, path: dashboard_path, text: "Dashboard", icon: "columns-gap" },
      { type: :transition, path: collection_path, text: "Products", icon: "box" },
      { type: :transition, path: collection_path, text: "Users", icon: "people-fill" },
      { type: :transition, path: collection_path, text: "Orders", icon: "cart-check-fill"},
      { type: :transition, path: collection_path, text: "Invoices", icon: "receipt"}
    ]
  end

  def header_navigation_extra_partial
    action path: form_path, method: :post do
      btn variant: :primary, outline: true, text: "hello"
    end
  end

  def toasts
    [
      { show_on: "page_loaded", title: "Page loaded", body: "Oh yes, page loaded!" },
      { show_on: "failure", title: "Error", body: "Something went wrong <br> {{ eventData.message }}".html_safe }
    ]
  end

end
