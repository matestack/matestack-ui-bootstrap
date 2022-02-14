require_relative "../registry"

class Matestack::Ui::Bootstrap::Layouts::AdminTemplate < Matestack::Ui::Layout

  include Matestack::Ui::Bootstrap::Registry

  def response(&block)
    matestack_vue_js_app do
      body_response(&block)
    end
  end

  def body_response(&block)
    div class: "d-flex flex-row" do
      if should_show_sidebar?
        div id: "sidebar", class: "sidebar-wrapper" do
          bs_sidebar sidebar_navigation_items: sidebar_navigation_items, slots: { sidebar_top: method(:sidebar_top_slot) }
        end
      end
      div id: "content", class: "content-wrapper w-100 #{content_background_class}" do
        if should_show_navbar?
          bs_container do
            bs_navbar brand: navbar_brand_config, items: navbar_items, class: "pt-4 #{'ps-5' if should_show_sidebar?}", collapse_class: "text-end text-lg-start pe-3"
          end
        end
        bs_container class: "my-5 px-4 pt-5" do
          page_switch do
            yield if block_given?
          end
        end
      end
    end
    toasts_partial
  end

  def should_show_sidebar?
    if !self.respond_to?(:sidebar_top_partial) && sidebar_navigation_items.empty?
      false
    else
      true
    end
  end

  def should_show_navbar?
    if navbar_brand_config.nil? && !self.respond_to?(:navbar_end_partial) && navbar_items.empty?
      false
    else
      true
    end
  end

  def sidebar_top_slot
    sidebar_top_partial if self.respond_to?(:sidebar_top_partial)
  end

  def toasts_partial
    toasts.each do |toast|
      bs_toast class: toast[:class],
            body: toast[:body].html_safe,
            placement: {
              position: 'bottom: 15px; right: 15px;',
              height: "200px"
            },
            show_on: toast[:show_on], hide_on: toast[:hide_on], autohide: toast[:autohide] || true
    end
  end

  def loading_state_slot
    # slot do
    #   div class: "d-flex justify-content-center" do
    #     spinner class: "mt-5"
    #   end
    # end
  end

  def navbar_items
    []
  end

  def sidebar_navigation_items
    []
  end

  def navbar_brand_config

  end

  def content_background_class
    "bg-light"
  end

end
