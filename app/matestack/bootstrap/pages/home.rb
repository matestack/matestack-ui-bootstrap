class Bootstrap::Pages::Home < Matestack::Ui::Page

  def prepare
    @page_item = {
      "1": "#",
      "2": "#",
      "3": "#"
    }
    @nav_items = {
      home: {
        type: :link,
        path: "#home",
        text: "Home"
      },
      product: {
        type: :link,
        path: "#profile",
        text: "Profile"
      },
      team: {
        type: :link,
        path: "#messages",
        text: "Message"
      },
    }
    @carousel_items = [
      {
        path: image_url("matestack-data.png"),
        title: "First slide label",
        text: "Nulla vitae elit libero, a pharetra augue mollis interdum.",
        interval: 10000
      },
      {
        path: image_url("matestack-data.png"),
        title: "Second slide label",
        text: "Nulla vitae elit libero, a pharetra augue mollis interdum."
      },
      {
        path: image_url("matestack-data.png"),
        title: "Third slide label",
        interval: 2000
      }
    ]
    @drowdown_items = [
      {
        type: :link,
        path: "#",
        text: "Nulla vitae elit libero",
      },
      {
        type: :button,
        text: "Action"
      },
      {
        type: :divider,
      }, 
      {
        type: :link,
        path: "#",
        text: "Separated link"
      }
    ]
  end

  def response 
    navbar brand_text: "BRAND TEXT", brand_path: "#", theme: :dark, sticky_top: true, items_class: "mr-auto ml-auto",
            items: { home: {type: :transition, path: "/", text: "Home"}, 
                    product: {type: :transition, path: "/", text: "Product"}, 
                    contact: {type: :transition, path: "/", text: "Contact"}, } do
                      btn text: "Login"
                    end
    navigation items: {
      home: { type: :link, path: "#home", text: "Home" },
      product: { type: :link, path: "#profile", text: "Profile" },
      team: { type: :link, path: "#messages", text: "Message" },
    }, pills: true, vertical: true
    navigation items: @nav_items, horizontal: :center, tabs: true
    div class: "tab-content" do
      div class: "tab-pane active", id: "home", attributes: { role: "tabpanel", 'aria-labelledby':  "home-tab" } do
        plain "Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat."
      end
      div class: "tab-pane", id: "profile", attributes: { role: "tabpanel", 'aria-labelledby': "profile-tab" } do
        plain "..........ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat."
      end
      div class: "tab-pane", id: "messages", attributes: {  role: "tabpanel", 'aria-labelledby': "messages-tab" } do
        plain "do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat."
      end
    end
    btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
    modal id: 'staticBackdrop', header: "Modal Title", body: "Modal Messages", footer: "Close",
    centered: true, scrollable: true, size: :lg    
    container size: :lg, class: "bg-light py-3 my-3" do
      row horizontal: :center, vertical: :center do
        # list_group id: "list-example3", items: [
        #   { type: :transition, path: "#list-item1", text: "Item 1" },
        #   { type: :transition, path: "#list-item2", text: "Item 2" } 
        # ]
        list_group id: "list-example3", class: "foobar",
        items: [
          { type: :label, text: "Item 1" },
          { type: :label, text: "Item 2" } 
        ]
        scrollspy target: "#list-example3" do
          heading size: 2, id: "list-item1", text: "Item 1"
          paragraph text: "Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur."
          heading size: 2, id: "list-item2", text: "Item 2"
          paragraph text: "Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur."
        end
      end
    end
    breadcrumb items: [
      {
        type: :link,
        path: "#",
        text: "Home",
      },
      {
        type: :link,
        text: "Data",
      }
    ]
    br 
    container size: :lg, class: "bg-warning py-3 my-3" do
      row do
        col do          
          popover text: "Popover", content: "Popover Content"
        end
        col  do          
          popover type: :link, placement: :top, tabindex: "0", style: :danger, trigger: "focus", title: "Dismissible popover", content: "And here's some amazing content. It's very engaging. Right?", text: "Dismissible Popover"
        end
        col do

          tooltip text: "Tooltip", title: "Tooltip Content", animation: 'false'
        end
      end
      row do
        btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
        modal id: 'staticBackdrop', static: true, m_title: "Modal Title", text: "Modal Messages", close_btn_text: "Close"
      end
      row horizontal: :center, vertical: :center do
        toast show_on: "myToasts", dispose_on: "hideToasts", header: "Bootstrap", body: "Hello, world! This is a toast message.", autohide: false
        col do          
          onclick emit: "myToasts" do
            btn text: "Show Toasts"
          end
        end
        col do
          onclick emit: "hideToasts" do
            btn text: "Hide Toasts"
          end
        end
      end
    end

    container size: :lg, class: "bg-warning py-3 my-3" do
      row horizontal: :center, vertical: :center do
        col md: 4 do
          dropdown reference: :parent, direction: :right, menu: @drowdown_items, text: "Dropdown"
          dropdown variant: :secondary, text: "Dropdown", menu: { items: @drowdown_items, class: "foobar" } 
          dropdown slots: { split_btn: split_button }
          dropdown text: "Dropdown", menu: [
            { type: :link, path: "#", text: "Nulla vitae elit" },
            { type: :button, text: "Action" }
          ] do
            paragraph text: "Test Block"
          end
        end
      end
    end

    container size: :lg, class: "bg-warning py-3 my-3" do
      row do
        col do
          paragraph do
            # btn text: "Collapse Btn", data: { toggle:"collapse", target:"#collapseExample" }, attributes: { "aria-expanded":"false", "aria-controls":"collapseExample" }
          end
          paragraph do
            btn text: "Button 1", data: { toggle: "collapse",  target: ".multi-collapse" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample1" }
            btn text: "Button 2", data: { toggle: "collapse",  target: ".multi-collapse" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample2" }
          end
          collapse id: "multiCollapseExample", card: "Random text for card body content", multi: true
          br
          collapse card: "Random text for card body content", class: "show", labelledby: "random-label"
          # collapse id: "collapseExample", dispose_on: "myCollapse", toggle_on: "toggleCollapse", card: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident."
          # onclick emit: "myCollapse" do
          #   btn text: "Collapse"
          # end
          # onclick emit: "toggleCollapse" do
          #   btn text: "Toggle Collapse"
          # end
        end
      end
      accordian items: [
        { header: { text: "Group Item #1", btn_variant: :light }, body: { text: "Random Text for Collapse #1" } },
        { header: { text: "Group Item #2", btn_class: "p-3 rounded-0" }, body: { text: "Random Text for Collapse #2" } },
        { header: { text: "Group Item #3" }, body: { text: "Random Text for Collapse #3" } }
      ]
      # div class: "accordion", id: "accordionExample" do
      #   div class: "card" do
      #     div class: "card-header", id: "headingOne" do
      #       heading size: 2, class: "mb-0" do
      #         btn style: :link, size: :block, class: "text-left", text: "Collapsible Group Item #1", data: { toggle:"collapse", target:"#collapseOne" }, attributes: { "aria-expanded":"true", "aria-controls":"collapseOne" }
      #       end
      #     end
      #     collapse id: "collapseOne", card: { class: "card-body", text: "Random Text Card No. 1"},labelledby: "headingOne", parent: "#accordionExample"
      #   end

      #   div class: "card" do
      #     div class: "card-header", id: "headingTwo" do
      #       heading size: 2, class: "mb-0" do
      #         btn style: :link, size: :block, class: "text-left", text: "Collapsible Group Item #2", data: { toggle:"collapse", target:"#collapseTwo" }, attributes: { "aria-expanded":"false", "aria-controls":"collapseTwo" }
      #       end
      #     end
      #     collapse id: "collapseTwo", card: { class: "card-body", text: "Random Text Card 2"},labelledby: "headingTwo", parent: "#accordionExample"
      #   end
      # end
    end
    container size: :fluid, class: "py-4 bg-dark" do
      col md: 8, offset: 2 do          
        carousel start: 2, prev_on: "prev_carousel", next_on: "next_carousel", pause_on: "pause", items: @carousel_items, controls: true, indicators: true
        onclick emit: "prev_carousel" do
          btn text: "Prev"
        end
        onclick emit: "pause" do
          btn text: "Pause"
        end
        onclick emit: "next_carousel" do
          btn text: "Next"
        end
      end
    end

    container size: :fluid, class: "bg-warning py-3 my-3" do
      
      alert close_on: 'close-alert', text: "Closing Alert test"  
      onclick emit: "close-alert" do
        btn text: "close alert"
      end
      alert color: :success, title: "Well done!", title_size: 2, text: "Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content."

      alert color: :warning, animate: true, dismissible: true do
        strong text: "Holy guacamole!"
        plain "You should check in on some of those fields below."
      end

      toggle show_on: "myEvent" do        
        alert heading: "Alert Heading", text: "This is an alert", 
                animate: true, dismissible: true
      end
      onclick emit: "myEvent" do
        btn text: "Show Alert"
      end
      
      onclick emit: 'dispose-alert' do
        btn text: 'Dispose'
      end
      alert heading: "Dipose alert", text: "This is an alert", 
        animated: true, dismissible: true, dispose_on: 'dispose-alert'
    end

    container size: :lg, class: "bg-warning py-3 my-3" do
      row do
        col do
          pagination
          pagination items: [
            { type: :link, path: "#", text: "1", active: false },
            { type: :link, path: "#", text: "2", active: false },
            { type: :link, path: "#", text: "3", active: true },
          ] do
          paragraph text: "Test Block"
          end
          pagination do
            plain "Test block"
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
        col md: 4, order_lg: 1, class: "bg-primary", offset: 2 do
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
          btn_group vertical: true, label: "Vertical Example" do 
            btn text: "V_Tab 4"
            btn text: "V_Tab 5"
            btn text: "V_Tab 6"
          end
          btn_group size: :sm, label: "Basic Example 2" do 
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
            btn_group type: :group, label: "Basic Example 2" do 
              btn text: "Tab 4"
              btn text: "Tab 5"
              btn text: "Tab 6"
            end
          end
          badge text: "9 - warning", color: :warning
          btn text: "Button" do
            badge text: "2", color: :secondary, sr_only: "unread message"
          end
          link path: "https://matestack.io" do
            close
          end
        end
      end
    end

    container size: :lg, class: "bg-dark py-4 my-4" do
      row do
        col do
          progress progress: 80, text: "... | ", color: :success, striped: true, animated: true do
            plain "50%"
          end
          br
          progress progress: 50, text: "50%", valuemin: 10, valuemax: 70
          br
          progress progress: [
              { value: 50, text: 50, variant: :success },
              { value: 25, text: 25, variant: :warning }
            ], text: "50%", valuemin: 10, valuemax: 70
        end
      end
      row do
        spinner color: :primary
        col md: 6 do
          btn style: :secoπndary, size: 2, class: "text-center p-4" do
            spinner type: :grow, smaller: true, color: :success
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
          card text: "Some quick example text to build on the card title and make up the bulk of the card's content.",
          title: "Card title", header_text: "Card Header", hide_footer: true do
            div class: "p-3" do
              btn text: "Card Button"
              btn text: "Another Button"
            end
          end
        end
          # card text: "With supporting text below as a natural lead-in to additional content.", 
          #       title: "Special title treatment", 
          #       slots: { header: my_card_header, footer: my_card_footer }, 
          #       footer_class: "text-muted", class: "text-center"
      end
    end
    container size: :fluid, class: "py-3 mb-3" do
      row do
        col md: 4 do
          card img_path: image_url("matestack-data.png"), text: "Some quick example text to build on the card title and make up the bulk of the card's content.",
              slots: { body: my_card_body }, hide_footer: true, hide_header: true do
                plain "Yield Content"
          end
        end
      end
    end
  end

  def my_card_header
    slot {
      navigation items: @nav_items, horizontal: :center, tabs: true
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
  def split_button 
    slot {
      btn text: "Split Button"
    }
  end
  def badge_element
    slot {
      badge text: "2"
    }
  end
end