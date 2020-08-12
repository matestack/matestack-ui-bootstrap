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
  end

  def response

    container size: :fluid, class: "bg-warning py-3 my-3" do

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
          btn_group size: 1, label: "Basic Example 2" do 
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
            # btn text: "Matestack", style: :link
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

    container size: :fluid, class: "py-3 mb-3" do
      row do
        3.times do
          col md: 4 do
            card title: "Card Title",
              header: "Card header", header_class: "h2 text-center",
              img_path: image_url("matestack-data.png"),
              footer: "2 days", footer_class: "text-muted",
              slots: { title: my_card_title, actions: my_card_actions, lists: my_card_lists } do
                paragraph text: "Some quick example text to build"
                link class: 'btn btn-primary', text: "crazy action", path: "#"
              end
          end
        end
      end
    end

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

  def my_card_title 
    slot {
      span text: "crazy header"
    }
  end

  def my_card_lists
    slot {
      ul class: 'list-group list-group-flush' do
        li class: "list-group-item" do plain "Item 1" end
        li class: "list-group-item" do plain "Item 2" end
        li class: "list-group-item" do plain "Item 3" end
      end
    }
  end

  def my_card_actions 
    slot {
      link class: 'btn btn-primary', text: "crazy action", path: "#"
    }
  end
end