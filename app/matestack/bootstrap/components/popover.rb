class Bootstrap::Components::Popover < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-popover" 

  # How i imagine using a popover
  #
  # popover content: 'A popover' do
  #   button text: 'Popover'
  # end
  # => <span data-toggle="popover" data-content="A Popover"><button>Popover</button></span>
  #
  # popover content: 'A popover', tag: :div do
  #   button text: 'Popover'
  # end
  # => <div data-toggle="popover" data-content="A Popover"><button>Popover</button></div>
  #
  # popover text: 'Popover', content: 'A popover', tag: :button # should be default
  # => <button data-toggle="popover" data-content="A Popover">Popover</button>
  #
  # popover text: 'Popover', content: 'A popover', dismissible: true, tabindex: 2
  # => <a tabindex="2" data-toggle="popover" data-content="A Popover" data-trigger="focus" role="button">Popover</a>
  #
  # popover text: 'Popover', content: 'A popover', tag: :a
  # => <a data-toggle="popover" data-content="A Popover">Popover</a>


  DATA_ALIAS_ATTRIBUTES = %i[container delay selector html template fallback_placement]

  DATA_ALIAS_ATTRIBUTES.each do |attribute|
    optional "#{attribute}": { as: :"bs_#{attribute}"}
  end

  # TODO:
  # for security reasons the sanitize, sanitizeFn and whiteList options cannot be supplied using data attributes.
  # sanitize sanitize_fn white_list

  optional class: { as: :bs_class }
  optional id: { as: :bs_id }
  DATA_ATTRIBUTES = %i[tag content title text variant animation placement tabindex trigger boundary offset popper_config]
  optional *DATA_ATTRIBUTES
  # :tag # different element to apply: div, span, links, button, ...
  # :content, :title # popover title and content strings
  # :animation # boolean, default true
  # :variant, :text # button styling & text
  # :placement # placement direction as string

  def response
    if tag.present? 
      public_send(tag, popover_attributes) do
        content_partial
      end
    else
      btn popover_attributes do
        content_partial
      end
    end
  end

  protected

  def content_partial
    plain text if text
    yield_components unless text
  end

  def popover_attributes
    attributes = {}.tap do |hash|
      hash[:class] = popover_classes
      hash[:attributes] = { role: (text ? 'button': nil), title: "#{title}", tabindex: "#{tabindex}" }
      hash[:data] = {}.tap do |data|
        DATA_ALIAS_ATTRIBUTES.each do |attribute|
          data[attribute] = self.send(:"bs_#{attribute}") if self.send(:"bs_#{attribute}")
        end
        (DATA_ATTRIBUTES - [:tag, :text, :variant]).each do |attribute|
          data[attribute] = self.send(:"#{attribute}") if self.send(:"#{attribute}")
        end
        data[:toggle] = "popover"
      end
    end
    html_attributes.merge(
      attributes
    )
  end

  def popover_classes
    [].tap do |classes|
      classes << "d-inline-block" unless text
      classes << "btn btn-#{variant}" if variant
      classes << bs_class
    end.join(' ').strip
  end

end