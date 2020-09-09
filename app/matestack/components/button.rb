class Components::Button < Matestack::Ui::StaticComponent

  optional :text, :type, :style, :size, class: { as: :bs_class }

  def response 
    button button_attributes do
      plain text if text
      yield_components
    end
  end

  protected

  def button_attributes
    html_attributes.merge(
      type: type || 'button',
      class: button_classes
    )
  end

  def button_classes
    foo = [].tap do |classes|
      classes << 'btn'
      # btn styles
      classes << (style ? "btn-#{style.to_s.gsub('_', '-')}" : 'btn-primary')
      # btn size
      classes << "btn-#{size}" if size
      # custom classes
      classes << bs_class
    end.join(' ').strip
  end
end