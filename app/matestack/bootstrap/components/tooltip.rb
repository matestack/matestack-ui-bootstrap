class Bootstrap::Components::Tooltip < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-tooltip" 

  DATA_ALIAS_ATTRIBUTES = %i[container delay selector html template fallback_placement]

  DATA_ALIAS_ATTRIBUTES.each do |attribute|
    optional "#{attribute}": { as: :"bs_#{attribute}"}
  end

  # TODO:
  # for security reasons the sanitize, sanitizeFn and whiteList options cannot be supplied using data attributes.
  # sanitize sanitize_fn white_list
  optional :content
  optional class: { as: :bs_class }
  optional id: { as: :bs_id }
  DATA_ATTRIBUTES = %i[type title text style animation placement tabindex trigger boundary offset popper_config]
  optional *DATA_ATTRIBUTES


  def response
    case :type
    when :div
      div tooltip_attributes do
        element_partial
      end
    when :span 
      span tooltip_attributes  do
        element_partial
      end
    when :link
      link tooltip_attributes 
    else
      btn tooltip_attributes 
    end
  end

  protected

  def element_partial
    if options[:slots] && options[:slots][:element]
      slot options[:slots][:element]
    else 
      btn style: style, attributes: { 'style': "pointer-events: none;" }, text: text
    end
  end

  def tooltip_attributes
    attributes = {}.tap do |hash|
      hash[:class] = tooltip_classes
      hash[:style] = style if (type == :button or !type.present?)

      hash[:attributes] = { role: "button", title: "#{title}", tabindex: "#{tabindex}" } if (type == :link or type == :a)

      hash[:text] = text if text.present?

      hash[:data] = {}.tap do |hash|
        DATA_ALIAS_ATTRIBUTES.each do |attribute|
          hash[attribute] = self.send(:"bs_#{attribute}") if self.send(:"bs_#{attribute}")
        end
        DATA_ATTRIBUTES.each do |attribute|
          hash[attribute] = self.send(:"#{attribute}") if self.send(:"#{attribute}")
        end
        hash[:toggle] = "tooltip"
        hash[:'original-title'] = content
      end        
    end
    html_attributes.merge(
      attributes
    )
  end

  def tooltip_classes
    [].tap do |classes|
      classes << "d-inline-block" if (type == :span or type == :div)
      classes << "btn btn-#{style}" if (type == :link or type == :a)

      classes << bs_class
    end.join(' ').strip
  end

end