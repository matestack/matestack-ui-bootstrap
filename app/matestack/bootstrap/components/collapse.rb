class Bootstrap::Components::Collapse < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-collapse" 
  
  optional :multi, :labelledby, :parent
  optional :card, class: { as: :bs_class }
  # event trigger
  optional :toggle_on, :show_on, :hide_on, :dispose_on

  def response 
    div collapse_attributes do
      card_partial if card
      yield_components
    end
  end

  protected

  def card_partial
    tmp_card = card.is_a?(Hash) ? self.card : { text: self.card }
    div class: "card card-body #{tmp_card[:class]}".strip do
      plain tmp_card[:text]
    end
  end

  def collapse_attributes
    html_attributes.merge(
      class: collapse_classes,
      data: { parent: parent },
      attributes: { 'aria-labelledby':"#{labelledby}" }
    )
  end

  def collapse_classes
    [].tap do |classes|
      classes << 'collapse'
      # mulit target
      classes << 'multi-collapse' if multi
      #custom classes 
      classes << bs_class
    end.join(' ').strip
  end

end