class Components::Container < Matestack::Ui::StaticComponent

  optional :size, class: { as: :bs_class }

  def response 
    div container_attributes do
      yield_components
    end
  end

  protected
  
  def container_attributes
    html_attributes.merge(
      class: container_classes
    )
  end

  def container_classes
    [].tap do |classes|
      classes << (size.present? ? "container-#{size}" : "container")
      classes << bs_class
    end.join(' ').strip
  end
end