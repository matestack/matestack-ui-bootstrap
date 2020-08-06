class Bootstrap::Pages::Home < Matestack::Ui::Page

  def response
    container size: "fluid", option: "bg-primary" do
      paragraph text: "Test"
    end
  end
end