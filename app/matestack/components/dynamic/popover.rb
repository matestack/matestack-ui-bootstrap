class Components::Dynamic::Popover < Matestack::Ui::VueJsComponent
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


  DATA_ATTRIBUTES = %i[animation container content delay html]
  optional *DATA_ATTRIBUTES

  DATA_ATTRIBUTES.each do |attribute|
    optional "#{attribute}": { as: :"bs_#{attribute}"}
  end

  optional :type # different element to apply 
  optional :content, :title # popover title and content strings
  optional :animation # boolean, default true
  optional :style, :text # button styling & text
  optional :placement # placement direction as string
  optional :tabindex, :trigger, class: { as: :bs_class }
  # optional :container, :delay, :selector, :template, :trigger, :offset, :tabindex # general settings
  #html
  # optional :fallback_placement
  optional :boundary
  # optional :sanitize
  # optional :white_list
  # optional :sanitize_fn
  optional :popper_config # in depth settings

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
      # hash[:style] = style if type == :button or !type.present?
      # hash[:attributes] = { role: "button", title: "#{title}", tabindex: "#{tabindex}" } if type == :link or type == :a
      # hash[:data] = { toggle: "popover", placement: "#{placement}", content: "#{content}" }
      # hash[:data] = { trigger:  "#{trigger}" } if trigger.present?
      # hash[:data] = { container: "#{container}"} if container.present?
      hash[:text] = text if text.present?

      hash[:data] = {}.tap do |hash|
        DATA_ATTRIBUTES.each do |attribute|
          hash[attribute] = self.send(:"bs_#{attribute}") if self.send(:"bs_#{attribute}")
        end
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