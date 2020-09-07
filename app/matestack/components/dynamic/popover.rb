class Components::Dynamic::Popover < Matestack::Ui:VueJsComponent

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

  optional :content, :title # popover title and content strings
  optional :animation # boolean, default true
  optional :placement # placement direction as string
  optional :container, :delay, :html, :selector, :template, :trigger, :offset # general settings
  optional :fallback_placement, :boundary, :sanitize, :white_list, :sanitize_fn, :popper_config # in depth settings

  def response
    
  end

end