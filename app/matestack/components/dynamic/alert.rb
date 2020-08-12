class Components::Dynamic::Alert < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-alert" 

  def setup
    @alert_id = "matestack-alert-#{SecureRandom.hex}"
    @component_config["alert-id"] = @alert_id
  end

  def response
    div id: @alert_id, class: "alert #{alert_classes}", attributes: { 'role': 'alert' } do
      if @options[:heading]
        heading size: heading_size, class: 'alert-heading', text: @options[:heading]
      end
      plain @options[:text] if @options[:text].present?
      if @options[:dismissible]
        button class: "close", data: { dismiss: "alert" },
                attributes: { 'aria-label':'Close', 'type':'button', '@click': 'alertInstance.close()' } do
          span attributes: { 'aria-hidden':'true' } do
            plain "&times;".html_safe
          end
        end
      end
      yield_components
    end
  end

  protected

  def alert_classes
    classes = []

    color = @options[:color].present? ? @options[:color] : "primary"
    classes << "alert-#{color}"

    classes << "alert-dismissible" if @options[:dismissible].present? && @options[:dismissible]
    classes << "fade show" if @options[:animated].present? && @options[:animated]
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