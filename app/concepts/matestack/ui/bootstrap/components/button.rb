class Matestack::Ui::Bootstrap::Components::Button < Matestack::Ui::Component

  optional :text, :type, :variant, :size, :outline
  optional :attributes, :class
  optional :transition 
  optional :action 
  optional :onclick 
  optional :link

  def response
    if context.transition.present? && context.transition.is_a?(Hash)
      transition button_attributes.merge(context.transition.merge({role: "button"})) do
        inner_response
      end
    elsif context.action.present? && context.action.is_a?(Hash)
      action button_attributes.merge(context.action.merge({role: "button"})) do
        inner_response
      end
    elsif context.onclick.present? && context.onclick.is_a?(Hash)
      onclick button_attributes.merge(context.onclick.merge({role: "button"})) do
        inner_response
      end
    elsif context.link.present? && context.link.is_a?(Hash)
      link button_attributes.merge(context.link.merge({role: "button"})) do
        inner_response
      end
    else
      button_response
    end
  end

  def button_response
    button button_attributes do
      inner_response
    end
  end

  def inner_response
    plain text if text
    yield
  end

  protected

  def button_attributes
    options.merge(
      type: context.type || 'button',
      class: button_classes, 
    ).merge(context.attributes)
  end

  def button_classes
    [].tap do |classes|
      classes << 'btn'
      # btn variants outlined or solid background
      if context.outline
        classes << "btn-outline-#{context.variant.to_s.gsub('_', '-') || 'primary'}"
      else
        classes << (context.variant ? "btn-#{context.variant.to_s.gsub('_', '-')}" : 'btn-primary')
      end
      # btn size
      classes << "btn-#{context.size}" if context.size
      # custom classes
      classes << context.class
    end.join(' ').strip
  end

end
