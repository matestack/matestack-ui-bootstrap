class Bootstrap::Layout::Sidebar < Matestack::Ui::VueJsComponent

  vue_js_component_name "matestack-ui-bootstrap-sidebar"

  optional :slots
  optional :sidebar_navigation_items

  def response
    div class: "sidebar-wrapper shadow-sm bg-white", id: "sidebar" do
      nav class: 'sidebar pt-4 px-3' do
        div class: "sidebar-toggler" do
          btn variant: :link, attributes: { "@click": "sidebarToggle" } do
            bootstrap_icon name: "list", size: 25, class: "text-muted"
          end
        end
        div class: "sidebar-top mb-3" do
          slot slots[:sidebar_top] if slots[:sidebar_top].present?
        end
        div class: "sidebar-navigation my-3" do
          sidebar_navigation_partial
        end
      end
    end
  end

  def sidebar_navigation_partial
    div class: "list-group" do
      sidebar_navigation_items.each do |item|
        if item[:type] == :link
          link class: "list-group-item list-group-item-action border-0 rounded", path: item[:path] do
            bootstrap_icon name: item[:icon], size: 20 if item[:icon]
            span class: "ps-3", text: item[:text] if item[:text]
          end
        else
          transition class: "list-group-item list-group-item-action border-0 rounded", path: item[:path], delay: item[:delay] || 300 do
            bootstrap_icon name: item[:icon], size: 20 if item[:icon]
            span class: "ps-3", text: item[:text] if item[:text]
          end
        end
      end
    end
  end


end
