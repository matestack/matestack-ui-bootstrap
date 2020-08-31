class Components::Dynamic::Collapse < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-collapse" 
  
  optional class: { as: :bs_class }

  def setup
    @collapse_id = "matestack-collapse-#{SecureRandom.hex}"
    @component_config["collapse-id"] = @collapse_id
  end

  def response 
  end

  protected

  def collapse_attributes
    html_attributes.merge(
      id: @collapse_id,
      class: collapse_classes
    )
  end

  def collapse_classes
    [].tap do |classes|
      #custom classes 
      classes << bs_class
    end.join(' ').strip
  end