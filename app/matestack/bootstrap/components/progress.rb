class Bootstrap::Components::Progress < Matestack::Ui::Component
  
  optional class: { as: :bs_class }
  optional :slots
  optional :text, :color, :striped, :animated, :bar_class, :bar_attributes
  optional :height
  optional :value, :valuemin, :valuemax 

  def response 
    div progress_attributes do
      # slot in case of multiple bars
      if slots && slots[:custom_bar]
        slot slots[:custom_bar]
      else
        div progress_bar_attributes do
          plain text if text
          yield_components
        end
      end
    end
  end

  protected
  def progress_attributes
    attributes = {}.tap do |hash|
      hash[:class] = progress_classes
      hash[:attributes] = { 'style': "height: #{height}px" } if height 
    end
    html_attributes.merge(
      attributes
    )
  end

  def progress_classes
    [].tap do |classes|
      classes << 'progress p-0'
      classes << bs_class
    end.join(' ').strip
  end

  def progress_bar_attributes
    bar_attrs = (bar_attributes || {}).tap do |hash|
      hash[:role] = "progressbar"
      hash[:style] = "width: #{value}%" if value > 0
      hash[:'aria-valuenow'] = value if value
      hash[:'aria-valuemin'] = (valuemin || '0')
      hash[:'aria-valuemax'] = (valuemax || '100')
    end
    {
      class: progress_bar_classes,
      attributes: bar_attrs
    }
  end

  def progress_bar_classes
    [].tap do |classes|
      classes << 'progress-bar'
      classes << "bg-#{(color || 'primary')}"
      classes << "progress-bar-striped" if striped
      classes << "progress-bar-animated" if animated
      classes << bar_class
    end.join(' ').strip
  end
end