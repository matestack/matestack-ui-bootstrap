class Bootstrap::Components::Scrollspy < Matestack::Ui::Component

  optional :offset # pixel to offset from top, by default 10
  optional method: { as: :bs_method} # find which section, by default auto
  optional :target # scroll target id
  optional class: { as: :bs_class} # adding custom class to scrollspy 

  def response 
    div scrollspy_attributes do
      yield_components
    end
  end

  protected

  def scrollspy_attributes
    attributes = {}.tap do |hash|
      hash[:class] = scrollspy_classes
      hash[:data] = { spy: "scroll", target: "#{target}" }
      hash[:data].merge!(offset: offset) if offset.present?
      hash[:data].merge!(method: :"#{bs_method}") if bs_method.present?
    end
    html_attributes.merge(
      attributes
    )
  end

  def scrollspy_classes
    [].tap do |classes|
      classes << bs_class
    end.join(' ').strip
  end
end