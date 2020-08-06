class Bootstrap::Pages::Home < Matestack::Ui::Page

  def response
    container size: "fluid", option: "bg-primary py-5" do
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
    end
  end
end