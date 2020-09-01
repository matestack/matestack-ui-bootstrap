class Components::Toasts < Matestack::Ui::StaticComponent

  optional class: { as: :bs_class }

  def response 
    div toast_attributes do
      
    end
  end

  protected

  def toast_attributes
    html_attributes.merge(
      
      class: toast_classes
    )
  end

  def toast_classes
    [].tap do |classes|
      # classes << 'btn'
      # custom classes
      classes << bs_class
    end.join(' ').strip
  end
end