class Bootstrap::Components::Collapse < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-collapse" 
  
  optional :text, :multi, :labelledby, :parent, :card_class, class: { as: :bs_class }, id: { as: :bs_id }

  def setup
    @component_config["collapse-id"] = bs_id
  end

  def response 
    div collapse_attributes do
      div class: card_classes do
        plain text if text
        yield_components if !text
      end
    end
  end

  protected

  def collapse_attributes
    html_attributes.merge(
      class: collapse_classes,
      data: { parent: parent },
      attributes: { 'aria-labelledby':"#{labelledby}" }
    )
  end

  def collapse_classes
    [].tap do |classes|
      # unclear behaviour: by default is hidden when having class "show"
      classes << 'collapse show'
      # mulit target
      classes << 'multi-collapse' if multi
      #custom classes 
      classes << bs_class
    end.join(' ').strip
  end

  def card_classes
    [].tap do |classes|
      classes << 'card card-body' if !card_class.present?
      #custom classes 
      classes << card_class
    end.join(' ').strip
  end

end