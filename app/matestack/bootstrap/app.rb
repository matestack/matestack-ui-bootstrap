class Bootstrap::App < Matestack::Ui::App
  
  def response
    header do
      heading size: 1, text: 'Bootstrap Addon Demo App'
    end
    
    main do
      page_content
    end
  end

end