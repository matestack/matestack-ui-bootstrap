class Bootstrap::Pages::Home < Matestack::Ui::Page

  def response
    container size: "fluid", option: "bg-primary py-5" do
      row horizontal: "end", vertical: "center", option: "bg-secondary" do
        paragraph text: "Test"
      end
    end
  end
end