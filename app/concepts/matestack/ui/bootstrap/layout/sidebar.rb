class Matestack::Ui::Bootstrap::Layout::Sidebar < Matestack::Ui::Bootstrap::BaseVueJsComponent

  vue_name "matestack-ui-bootstrap-sidebar"

  
  optional :sidebar_navigation_items

  def response
    div class: "sidebar-wrapper shadow-sm bg-white", id: "sidebar" do
      nav class: 'sidebar pt-4 px-3' do
        div class: "sidebar-toggler" do
          bs_btn variant: :link, "@click": "sidebarToggle" do
            bs_icon name: "list", size: 25, class: "text-muted"
          end
        end
        div class: "sidebar-top mb-3" do
          slot :sidebar_top if slots && slots[:sidebar_top].present?
        end
        div class: "sidebar-navigation my-3" do
          sidebar_navigation_partial
        end
      end
    end
  end

  def sidebar_navigation_partial
    div class: "list-group" do
      context.sidebar_navigation_items.each do |item|
        if item[:type] == :link
          a class: "list-group-item list-group-item-action border-0 rounded", href: item[:path] do
            bs_icon name: item[:icon], size: 20 if item[:icon]
            span item[:text], class: "ps-3" if item[:text]
          end
        else
          transition class: "list-group-item list-group-item-action border-0 rounded", path: item[:path], delay: item[:delay] || 300 do
            bs_icon name: item[:icon], size: 20 if item[:icon]
            span item[:text], class: "ps-3" if item[:text]
          end
        end
      end
    end
  end


end
