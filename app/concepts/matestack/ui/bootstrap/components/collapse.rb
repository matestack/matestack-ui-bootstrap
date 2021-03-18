class Matestack::Ui::Bootstrap::Components::Collapse < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name "matestack-ui-bootstrap-collapse"

  optional :multi, :labelledby, :parent, :class
  optional :card # possible keys: class, text
  # event trigger
  optional :toggle_on, :show_on, :hide_on, :dispose_on

  def response
    div collapse_attributes do
      card_partial if card
      yield if block_given?
    end
  end

  protected

  def config
    {}.tap do |props|
      props[:toggle_on] = context.toggle_on
      props[:show_on] = context.show_on
      props[:hide_on] = context.hide_on
      props[:dispose_on] = context.dispose_on
    end
  end

  def card_partial
    tmp_card = context.card.is_a?(Hash) ? context.card : { text: context.card }
    div class: "card card-body #{tmp_card[:class]}".strip do
      plain tmp_card[:text]
    end
  end

  def collapse_attributes
    options.merge(
      class: collapse_classes,
      data: { "bs-parent": context.parent },
      'aria-labelledby': "#{context.labelledby}"
    )
  end

  def collapse_classes
    [].tap do |classes|
      classes << 'collapse'
      # mulit target
      classes << 'multi-collapse' if context.multi
      #custom classes
      classes << context.class
    end.join(' ').strip
  end

end
