require_relative "../base_component"

class Matestack::Ui::Bootstrap::Components::Scrollspy < Matestack::Ui::Bootstrap::BaseComponent

  required :height

  optional :offset # pixel to offset from top, by default 10
  optional method: { as: :bs_method } # find which section, by default auto
  optional :target # scroll target id
  optional class: { as:  :bs_class } # adding custom class to scrollspy

  def response
    div scrollspy_attributes do
      yield if block_given?
    end
  end

  protected

  def scrollspy_attributes
    attributes = {}.tap do |hash|
      hash[:class] = scrollspy_classes
      hash[:data] = { "bs-spy": "scroll", "bs-target": "#{context.target}" }
      hash[:data].merge!("bs-offset": context.offset) if context.offset.present?
      hash[:data].merge!("bs-method": :"#{context.bs_method}") if context.bs_method.present?
      hash[:style] = "overflow-y: scroll; position: relative;"
      hash[:style] << "height: #{parsed_height};"
      hash[:tabindex] = 0
    end
    options.merge(
      attributes
    )
  end

  def parsed_height
    if context.height.present?
      if context.height.to_s.include?("px") || context.height.to_s.include?("em") || context.height.to_s.include?("rem")
        context.height
      else
        "#{context.height}px"
      end
    end
  end

  def scrollspy_classes
    [].tap do |classes|
      classes << context.bs_class
    end.join(' ').strip
  end
end
