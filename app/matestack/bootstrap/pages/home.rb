class Bootstrap::Pages::Home < Matestack::Ui::Page

  def response
    container size: "fluid", option: "bg-light py-5" do
      
      heading size: 1, text: "Addon Testing", class: "custom_heading"

      row horizontal: "start", vertical: "center", option: "bg-secondary" do
        col xs: 12, sm: 12, md: 4, lg: 4, option: "bg-warning" do          
          paragraph text: "Test"
        end
        col xs: 12, sm: 12, md: 4, lg: 4, order_lg: 5, option: "bg-info" do          
          paragraph text: "Test 2"
        end
        col md: 4, order_lg: 1, option: "bg-secondary" do
          paragraph text: "Test 3"
        end
      end
      row id: "second_row", option: "bg-white my-3" do
        col default: 12, md: 6, option: "bg-primary", align_self: "start" do
          paragraph text: "Second Row, Col 1"
        end

        col default: 12, md: 6, option: "bg-secondary", align_self: "center" do
          paragraph text: "Second Row, Col 2"
        end
      end
    end
  end
end