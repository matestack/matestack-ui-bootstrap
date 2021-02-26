class Matestack::Ui::Bootstrap::Components::Scrollspy < Matestack::Ui::Component

  requires :height
  
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
      hash[:data] = { "bs-spy": "scroll", "bs-target": "#{target}" }
      hash[:data].merge!("bs-offset": offset) if offset.present?
      hash[:data].merge!("bs-method": :"#{bs_method}") if bs_method.present?
      hash[:style] = "overflow-y: scroll; position: relative;"
      hash[:style] << "height: #{parsed_height};"
      hash[:tabindex] = 0
    end
    html_attributes.merge(
      attributes
    )
  end

  def parsed_height
    if height.present?
      if height.to_s.include?("px") || height.to_s.include?("em") || height.to_s.include?("rem")
        height
      else
        "#{height}px"
      end
    end
  end

  def scrollspy_classes
    [].tap do |classes|
      classes << bs_class
    end.join(' ').strip
  end
end
