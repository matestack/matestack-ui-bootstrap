class Components::Dynamic::Alert < Matestack::Ui::DynamicComponent
  def response
    div class: "alert #{alert_classes}", attributes: alert_attributes do
      if @options[:heading]
        heading size: heading_size, class: 'alert-heading', text: @options[:heading]
      end
      paragraph text: @options[:text] if @options[:alert].present?
      yield_components
    end
  end

  protected

  def alert_classes
    classes = []

    classes << "alert-#{@options[:color]}" if @options[:color].present?

    classes << "alert-dismissible" if @options[:dismissible].present? && @options[:dismissible].present? == true
    classes << "fade show" if @options[:animated].present? && @options[:animated].present? == true
    classes << @options[:class]
    classes.join(' ') 
  end

  def alert_attributes
    attrs = @options[:attributes] || {}
    attrs
  end

  def heading_size
    size = 4
    size = options[:heading_size] if options[:heading_size].present?
    size
  end

end