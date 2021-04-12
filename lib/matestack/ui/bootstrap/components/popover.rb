require_relative "../base_vue_js_component"

class Matestack::Ui::Bootstrap::Components::Popover < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name "matestack-ui-bootstrap-popover"

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
    optional :"#{attribute}"
  end

  # TODO:
  # for security reasons the sanitize, sanitizeFn and whiteList options cannot be supplied using data attributes.
  # sanitize sanitize_fn white_list

  optional class: { as:  :bs_class }
  optional id: { as: :bs_id }
  DATA_ATTRIBUTES = %i[tag content title variant animation placement tabindex trigger boundary offset popper_config]
  optional *DATA_ATTRIBUTES
  # :tag # different element to apply: div, span, links, button, ...
  # :content, :title # popover title and content strings
  # :animation # boolean, default true
  # :variant, :text # button styling & text
  # :placement # placement direction as string

  def response(&block)
    if context.tag.present?
      public_send(context.tag, popover_attributes) do
        content_partial(&block)
      end
    else
      bs_btn popover_attributes do
        content_partial(&block)
      end
    end
  end

  protected

  def content_partial(&block)
    plain context.text if context.text
    yield if block_given? unless context.text
  end

  def popover_attributes
    attributes = {}.tap do |hash|
      hash[:class] = popover_classes
      hash[:role] = (context.text ? 'button': nil)
      hash[:title] = "#{context.title}"
      hash[:tabindex] = "#{context.tabindex}"
      hash[:data] = {}.tap do |data|
        DATA_ALIAS_ATTRIBUTES.each do |attribute|
          data["bs-#{attribute}"] = context.send("#{attribute}") if context.send("#{attribute}")
        end
        (DATA_ATTRIBUTES - [:tag, :text, :variant]).each do |attribute|
          data["bs-#{attribute}"] = context.send("#{attribute}") if context.send("#{attribute}")
        end
        data["bs-toggle"] = "popover"
      end
    end
    options.merge(
      attributes || {}
    )
  end

  def popover_classes
    [].tap do |classes|
      classes << "d-inline-block" unless context.text
      classes << "btn btn-#{context.variant}" if context.variant
      classes << context.bs_class
    end.join(' ').strip
  end

end
