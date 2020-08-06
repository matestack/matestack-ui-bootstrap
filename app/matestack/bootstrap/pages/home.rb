class Bootstrap::Pages::Home < Matestack::Ui:Page

  def response
    5.times do
      paragraph text: 'Hello, first page!'
    end
  end
end