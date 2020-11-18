class Bootstrap::Apps::Admin < Matestack::Ui::App

  def response
    navbar fixed_top: true, theme: :white, brand: brand, items: header_navigation_items, class: "shadow-sm" do
      header_navigation_extra_partial
    end
    main do
      div class: "d-flex flex-row" do
        div class: "sidebar-wrapper" do
          sidebar_partial
        end
        div class: "content-wrapper w-100 mt-5" do
          container class: "mt-5" do
            yield_page slots: { loading_state: loading_state_slot }
          end
        end
      end
      toasts_partial
    end
  end

  def sidebar_partial
    nav class: 'sidebar' do
      div class: "list-group" do
        sidebar_navigation_items.each do |item|
          if item[:type] == :link
            link class: "list-group-item list-group-item-action border-0 rounded-right", path: item[:path] do
              bootstrap_icon name: item[:icon], size: 20 if item[:icon]
              span class: "pl-3", text: item[:text] if item[:text]
            end
          else
            transition class: "list-group-item list-group-item-action border-0 rounded-right", path: item[:path], delay: item[:delay] || 300 do
              bootstrap_icon name: item[:icon], size: 20 if item[:icon]
              span class: "pl-3", text: item[:text] if item[:text]
            end
          end
        end
      end
    end
  end

  def toasts_partial
    toasts.each do |toast|
      toast class: toast[:class],
            body: toast[:body].html_safe,
            placement: {
              position: 'bottom: 15px; right: 15px;',
              height: "200px"
            },
            show_on: toast[:show_on], hide_on: toast[:hide_on], autohide: toast[:autohide] || true
    end
  end

  def loading_state_slot
    slot do
      # div class: "d-flex justify-content-center" do
      #   spinner class: "mt-5"
      # end
    end
  end

  def brand
    {
      text: "Admin UI",
      path: root_path
    }
  end

  def header_navigation_items
    []
  end

  def sidebar_navigation_items
    []
  end

end
