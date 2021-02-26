class Matestack::Ui::Bootstrap::Components::Button < Matestack::Ui::Component

  optional :text, :type, :variant, :size, :outline
  optional attributes: { as: :bs_attrs }, class: { as: :bs_class }
  optional transition: { as: :bs_btn_transition }
  optional action: { as: :bs_btn_action }
  optional onclick: { as: :bs_btn_onclick }
  optional link: { as: :bs_btn_link }

  def response
    if bs_btn_transition.present? && bs_btn_transition.is_a?(Hash)
      transition button_attributes.merge(bs_btn_transition.merge({attributes: { role: "button"} })) do
        inner_response
      end
    elsif bs_btn_action.present? && bs_btn_action.is_a?(Hash)
      action button_attributes.merge(bs_btn_action.merge({attributes: { role: "button"} })) do
        inner_response
      end
    elsif bs_btn_onclick.present? && bs_btn_onclick.is_a?(Hash)
      onclick button_attributes.merge(bs_btn_onclick.merge({attributes: { role: "button"} })) do
        inner_response
      end
    elsif bs_btn_link.present? && bs_btn_link.is_a?(Hash)
      link button_attributes.merge(bs_btn_link.merge({attributes: { role: "button"} })) do
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
    yield_components
  end

  protected

  def button_attributes
    html_attributes.merge(
      type: type || 'button',
      class: button_classes,
      attributes: bs_attrs
    )
  end

  def button_classes
    [].tap do |classes|
      classes << 'btn'
      # btn variants outlined or solid background
      if outline
        classes << "btn-outline-#{variant.to_s.gsub('_', '-') || 'primary'}"
      else
        classes << (variant ? "btn-#{variant.to_s.gsub('_', '-')}" : 'btn-primary')
      end
      # btn size
      classes << "btn-#{size}" if size
      # custom classes
      classes << bs_class
    end.join(' ').strip
  end

end
