class Matestack::Ui::Bootstrap::Components::Button < Matestack::Ui::Bootstrap::BaseComponent

  optional :type, :variant, :size, :outline
  optional :attributes, class: { as:  :bs_class }
  optional :transition
  optional :action
  optional :onclick
  optional :link

  def response(&block)
    if context.transition.present? && context.transition.is_a?(Hash)
      transition button_attributes.merge(context.transition.merge({role: "button"})) do
        inner_response(&block)
      end
    elsif context.action.present? && context.action.is_a?(Hash)
      action button_attributes.merge(context.action.merge({role: "button"})) do
        inner_response(&block)
      end
    elsif context.onclick.present? && context.onclick.is_a?(Hash)
      onclick button_attributes.merge(context.onclick.merge({role: "button"})) do
        inner_response(&block)
      end
    elsif context.link.present? && context.link.is_a?(Hash)
      a button_attributes.merge(context.link.merge({role: "button"})) do
        inner_response(&block)
      end
    else
      button_response(&block)
    end
  end

  def button_response(&block)
    button button_attributes do
      inner_response(&block)
    end
  end

  def inner_response(&block)
    plain context.text if context.text
    yield if block_given?
  end

  protected

  def button_attributes
    options.tap do |opts|
      opts[:type] = context.type || 'button'
      opts[:class] = button_classes
      opts.merge(context.attributes || {})
    end
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
      classes << context.bs_class
    end.join(' ').strip
  end

end
