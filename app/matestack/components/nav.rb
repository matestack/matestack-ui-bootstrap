class Components::Nav < Matestack::Ui::StaticComponent

  optional class: { as: :bs_class }

  def response 
    nav nav_attributes do
      
      yield_components 
    end
  end

  protected

  def nav_attributes
    html_attributes.merge(
      class: nav_classes
    )
  end

  def nav_classes
    [].tap do |classes|
      classes << 'nav'

      classes << bs_class
    end.join(' ').strip
  end
end