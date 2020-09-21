class Bootstrap::Components::Button < Matestack::Ui::Component

  optional :text, :kind, :variant, :size, class: { as: :bs_class }

  def response 
    button button_attributes do
      plain text if text
      yield_components
    end
  end

  protected

  def button_attributes
    html_attributes.merge(
      type: kind || 'button',
      class: button_classes
    )
  end

  def button_classes
    foo = [].tap do |classes|
      classes << 'btn'
      # btn variants
      classes << (variant ? "btn-#{variant.to_s.gsub('_', '-')}" : 'btn-primary')
      # btn size
      classes << "btn-#{size}" if size
      # custom classes
      classes << bs_class
    end.join(' ').strip
  end
end