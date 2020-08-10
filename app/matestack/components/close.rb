class Components::Close < Matestack::Ui::StaticComponent

  def response
    # could not test it fully, need modal component 
    button class: "close", data: { dismiss: "#{@options[:dismiss]}" },
            attributes: { 'aria-label':'Close', 'type':'button' } do
      span attributes: { 'aria-hidden':'true' } do
        plain "&times;".html_safe
      end
    end
  end

end