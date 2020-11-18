class Bootstrap::Components::Close < Matestack::Ui::Component

  optional :dismiss, class: { as: :bs_class }
  optional :attributes

  def response
    button close_attributes do
      span attributes: { 'aria-hidden': 'true' } do
        # plain "&times;".html_safe
      end
    end
  end

  def close_attributes
    html_attributes.merge(
      class: close_classes,
      data: { dismiss: "#{dismiss}" },
      type: 'button',
      attributes: (attributes || {}).merge({ 'aria-label': 'Close' })
    )
  end

  def close_classes
    [].tap do |classes|
      classes << 'btn-close'
      classes << bs_class
    end.join(' ').strip
  end

end
