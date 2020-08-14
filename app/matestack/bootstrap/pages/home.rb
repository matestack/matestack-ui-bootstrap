class Bootstrap::Pages::Home < Matestack::Ui::Page

  def prepare
    @page_item_2 = {
      "<<": "#",
      "1": "#",
      "2": "#",
      ">>": "#"
    }
    @page_item = {
      "1": "#",
      "2": "#",
      "3": "#"
    }
    @nav_items = {
      home: {
        type: :transition,
        path: "/",
        text: "Home"
      },
      team: {
        type: :transition,
        path: "#",
        text: "Team"
      },
    }
  end

  def response
    # navbar list: {
    #   home: {type: :transition, path: "#", text: "Home"},
    #   link: {type: :transition, path: "#", text: "Link"},
    # }, color: :light, theme: :light, list_class: "mr-auto mb-2 mb-lg-0", brand: {"#": "Navbar"} do
    #   # yield a link component 
    #   btn style: :outline_success, class: "justify-content-end", text: "Main button"
    # end
    # navbar list: {
    #   home: {type: :transition, path: "#", text: "Home"},
    #   link: {type: :transition, path: "#", text: "Link"},
    # }, color: :light, theme: :light, list_class: "mr-auto mb-2 mb-lg-0", brand: {"#": "Navbar"} 
    # navbar list: @nav_items, color: :primary, theme: :dark, brand: {"/": "brand"}, toggle_pos: :right, sticky_top: true do
    #   btn text: "About"
    # end

    navbar slots: { custom_items: my_navbar }, color: :primary, theme: :dark, sticky_top: true

    container size: :fluid, class: "bg-warning py-3 my-3" do

      btn text: "Test Button Type", type: :submit

      alert text: "Alert test....", animated: true, dismissible: true

      toggle show_on: "myEvent" do        
        alert heading: "Alert Heading", text: "This is an alert", 
                animated: true, dismissible: true
      end
      onclick emit: "myEvent" do
        btn text: "Show Alert"
      end
    end

    container size: :lg, class: "bg-warning py-3 my-3" do
      row do
        col do
          pagination items: @page_item_2, active_item: 1, size: 2
          pagination class: "justify-content-center" do
            @page_item.each do |text, path|
              li class: "page-item" do
                link class: "page-link", path: path do
                  plain text
                end
              end
            end
          end
        end
      end
    end

    container size: :xl, class: "bg-light py-5" do

      heading size: 2, text: "Addon Testing"

      row horizontal: "start", vertical: :start, class: "bg-secondary px-3" do
        col sm: 12, md: 4, lg: 4, class: "bg-warning" do          
          paragraph text: "Test"
        end
        col sm: 12, md: 4, lg: 4, order_lg: 5, class: "bg-info" do          
          paragraph text: "Test 2"
        end
        col md: 4, order_lg: 1, class: "bg-primary" do
          paragraph text: "Test 3"
        end
      end
      row id: "second_row", class: "my-3", horizontal: :evenly do
        col default: 12, md: 3, class: "bg-primary border", align_self: :center do
          paragraph text: "Second Row, Col 1"
        end
        col default: 12, md: 3, class: "bg-warning", align_self: :start do
          paragraph text: "Second Row, Col 2"
        end
        col default: 12, md: 3, class: "bg-secondary", align_self: :end do
          paragraph text: "Second Row, Col 3"
        end
      end
    end
    container size: :lg, class: "bg-dark py-4" do
      row do
        col do
          btn_group label: "Basic Example 2" do 
            btn text: "Tab 4"
            btn text: "Tab 5"
            btn text: "Tab 6"
          end
          btn_group size: 2, label: "Basic Example 2" do 
            btn text: "Tab 4"
            btn text: "Tab 5"
            btn text: "Tab 6"
          end
          btn_group type: :toolbar, class: "justify-content-between my-2", label: "Toolbar" do            
            btn_group type: :group, vertical: true, label: "Basic Example" do 
              btn text: "Tab 1"
              btn text: "Tab 2"
              btn text: "Tab 3"
            end
            btn_group type: :group, size: 3, label: "Basic Example 2" do 
              btn text: "Tab 4"
              btn text: "Tab 5"
              btn text: "Tab 6"
            end
          end
          badge text: "9 - warning", color: :warning
          btn text: "Button", size: 2, style: :outline_primary
          btn text: "Button with Badge" do
            badge text: "primary", color: :success, class: "text-dark"
          end
          link path: "https://matestack.io" do
            close
          end
        end
      end
    end

    container size: :lg, class: "bg-dark py-4 my-4" do
      row do
        progress height: 40, value: 80, text: "50%", color: :success, striped: true, animated: true
        progress height: 30, slots: { custom_bar: my_progress_bars }
      end
      row do
        spinner color: :primary
        col md: 6 do
          btn style: :secondary, size: 2, class: "text-center p-4" do
            spinner type: :grow, small: true, color: :success
            plain "Loading..."
          end
          btn style: :success do
            plain "Second"
          end
        end
      end
    end
    container class: "my-5 py-3 wrapper bg-warning" do
      row horizontal: :center do
        col md: 6 do
          # card img_path: image_url("matestack-data.png"), title: "Card title", 
          #     text: "Some quick example text to build on the card title and make up the bulk of the card's content." do
          #   div class: "p-3" do
          #     btn text: "Card Button"
          #     btn text: "Another Button"
          #   end
          # end
          card text: "With supporting text below as a natural lead-in to additional content.", 
                title: "Special title treatment", 
                slots: { header: my_card_header, footer: my_card_footer }, 
                footer_class: "text-muted", class: "text-center"
        end
      end
    end
    container size: :fluid, class: "py-3 mb-3" do
      row do
    #     3.times do
          col md: 4 do
    #         card img_path: image_url("matestack-data.png"), text: "Some quick example text to build on the card title and make up the bulk of the card's content.",
    #             slots: { body: my_card_body } do
    #               plain "Yield Content"
    #             end
    #       end
        end
      end
    end
  end

  def my_card_header
    slot {
      ul class: "nav nav-tabs card-header-tabs" do
        li class: "nav-item" do 
          link class: "nav-link", path: "#", text: "Tab 1"  
        end
        li class: "nav-item" do 
          link class: "nav-link", path: "#", text: "Tab 2"  
        end
      end
    }
  end

  def my_card_footer
    slot {
      plain "2 days ago"
    }
  end

  def my_card_body
    slot {
      ul class: 'list-group list-group-flush' do
        li class: "list-group-item" do plain "Item 1" end
        li class: "list-group-item" do plain "Item 2" end
        li class: "list-group-item" do plain "Item 3" end
      end
      link class: 'btn btn-link', text: "Card link", path: "#"
      link class: 'btn btn-link', text: "Another link", path: "#"
    }
  end

  def my_navbar
    slot {
      span class: "navbar-text", text: "Navbar text with an inline element"
    }
  end

  def my_progress_bars
    slot {
      div class: "progress-bar bg-success", attributes: { 'role':"progressbar", 'style':"width: 15%" } do
        plain "15%"
      end
      div class: "progress-bar bg-info", attributes: { 'role':"progressbar", 'style':"width: 30%" } do
        plain "35%"
      end
      div class: "progress-bar bg-warning", attributes: { 'role':"progressbar", 'style':"width: 20%" }
    }
  end

  def badge_element
    slot {
      badge text: "2"
    }
  end
end