class Components::Close < Matestack::Ui::StaticComponent

  optional :dismiss, class: { as: :bs_class }

  def response
    # could not test it fully, need modal component 
    button close_attributes do
      span attributes: { 'aria-hidden': 'true' } do
        plain "&times;".html_safe
      end
    end
  end

  def close_attributes
    html_attributes.merge(
      class: close_classes,
      data: { dismiss: "#{dismiss}" },
      attributes: { 'aria-label': 'Close', type: 'button' }
    )
  end

  def close_classes
    [].tap do |classes|
      classes << 'close'
      classes << bs_class
    end.join(' ').strip
  end

end