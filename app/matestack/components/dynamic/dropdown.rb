class Components::Dynamic::dropdown < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-dropdown" 
  
  optional class: { as: :bs_class }, id: { as: :bs_id }

  def setup
    @component_config["dropdown-id"] = bs_id
  end

  def response 
    div dropdown_attributes do
      yield_components 
    end
  end

  protected

  def dropdown_attributes
    html_attributes.merge(
      class: dropdown_classes
    )
  end

  def dropdown_classes
    [].tap do |classes|
      classes << 'dropdown'
      #custom classes 
      classes << bs_class
    end.join(' ').strip
  end
end