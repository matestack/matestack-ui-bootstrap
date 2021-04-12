require_relative "../base_component"

class Matestack::Ui::Bootstrap::Components::Close < Matestack::Ui::Bootstrap::BaseComponent

  optional :dismiss, class: { as:  :bs_class }
  optional :attributes

  def response
    button close_attributes do
      span 'aria-hidden': 'true' do
        # plain "&times;".html_safe
      end
    end
  end

  def close_attributes
    options.merge(
      class: close_classes,
      data: { "bs-dismiss": "#{context.dismiss}" },
      type: 'button'
    ).merge((context.attributes || {}).merge({ 'aria-label': 'Close' }))
  end

  def close_classes
    [].tap do |classes|
      classes << 'btn-close'
      classes << context.bs_class
    end.join(' ').strip
  end

end
