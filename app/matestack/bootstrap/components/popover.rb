class Bootstrap::Components::Popover < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-popover" 

  # How i imagine using a popover
  #
  # popover content: 'A popover' do
  #   button text: 'Popover'
  # end
  # => <span data-toggle="popover" data-content="A Popover"><button>Popover</button></span>
  #
  # popover content: 'A popover', type: :div do
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
  DATA_ATTRIBUTES = %i[type content title text style animation placement tabindex trigger boundary offset popper_config]
  optional *DATA_ATTRIBUTES
  # :type # different element to apply 
  # :content, :title # popover title and content strings
  # :animation # boolean, default true
  # :style, :text # button styling & text
  # :placement # placement direction as string

  def response
    case :type
    when :div
      div popover_attributes do
        element_partial
      end
    when :span 
      span popover_attributes  do
        element_partial
      end
    when :link
      link popover_attributes 
    else
      btn popover_attributes 
    end
  end

  protected

  def element_partial
    if options[:slots] && options[:slots][:element]
      slot options[:slots][:element]
    else 
      btn style: style, attributes: { 'style': "pointer-events: none;" }, text: text
    end
  end

  def popover_attributes
    attributes = {}.tap do |hash|
      hash[:class] = popover_classes
      hash[:style] = style if (type == :button or !type.present?)
      hash[:attributes] = { role: "button", title: "#{title}", tabindex: "#{tabindex}" } if (type == :link or type == :a)

      hash[:text] = text if text.present?

      hash[:data] = {}.tap do |hash|
        DATA_ALIAS_ATTRIBUTES.each do |attribute|
          hash[attribute] = self.send(:"bs_#{attribute}") if self.send(:"bs_#{attribute}")
        end
        DATA_ATTRIBUTES.each do |attribute|
          hash[attribute] = self.send(:"#{attribute}") if self.send(:"#{attribute}")
        end
        hash[:toggle] = "popover"
      end

    end
    html_attributes.merge(
      attributes
    )
  end

  def popover_classes
    [].tap do |classes|
      classes << "d-inline-block" if type == :span or type == :div
      classes << "btn btn-#{style}" if type == :link or type == :a

      classes << bs_class
    end.join(' ').strip
  end

end