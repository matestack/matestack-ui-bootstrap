class Components::Scrollspy < Matestack::Ui::StaticComponent

  optional :offset # pixel to offset from top, by default 10
  optional :method # find which section, by default auto
  optional :target # scroll target id
  optional class: { as: :bs_class} # adding custom class to scrollspy 

  def response 
    div scrollspy_attributes do
      yield_components
    end
  end

  protected

  def scrollspy_attributes
    html_attributes.merge(
      class: scrollspy_classes,
      data: scrollspy_data
    )
  end

  def scrollspy_classes
    [].tap do |classes|
      classes << bs_class
    end.join(' ').strip
  end

  def scrollspy_data
    {}.tap do |hash|
      hash[:data] = { spy: "scroll"}
      hash[:data] = { target: "#{target}" }
      hash[:data] = { offset: "#{offset}" } if offset.present?
      hash[:data] = { method: "#{method}" } if method.present?
    end
  end
end