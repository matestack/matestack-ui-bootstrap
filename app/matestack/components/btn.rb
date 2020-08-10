class Components::Btn < Matestack::Ui::StaticComponent

  def response 
    button id: "#{options[:id]}", text: "#{options[:text]}", disabled: @options[:disabled],
            data: button_data, attributes: button_attributes,
            class: "btn #{button_classes}" do
      yield_components
    end
  end

  protected

  def button_attributes
    attrs = @options[:attributes] || {}
    attrs
  end

  def button_data
    attrs = @options[:data] || {}
    attrs
  end

  def button_classes
    btn_classes = []

    #btn styles
    button_styles.each do |style| 
      btn_classes << "btn-#{style}".gsub('_','-') if @options[:style] == style
    end
    btn_classes << "btn-primary" unless @options[:style].present? # default style

    #btn size
    btn_classes << "btn-#{button_sizes.at(@options[:size])}" if @options[:size].present?

    #optional classes
    btn_classes << @options[:class]

    btn_classes.join(' ') 
  end

  def button_styles
    [:primary, :secondary, :success, :danger, :warning, :info, :light, :dark, :link,  :outline_primary, :outline_secondary, :outline_success, :outline_danger, :outline_warning, :outline_info, :outline_light, :outline_dark, :outline_link]
  end

  def button_sizes
    [:block, :sm, :md, :lg]
  end
end