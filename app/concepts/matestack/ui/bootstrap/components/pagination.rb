class Matestack::Ui::Bootstrap::Components::Pagination < Matestack::Ui::Bootstrap::BaseComponent

  optional :aria_label, :size
  optional :items

  def response
    nav pagination_attributes do
      ul class: ul_classes do
        if context.items.present?
          context.items.each do |item|
            li class: "page-item #{ 'active' if item[:active] }" do
              if item[:type] == :link
                a item.merge({ class: 'page-link' })
              else
                transition item.merge({ class: 'page-link' })
              end
            end
          end
        end
        yield if block_given?
      end
    end
  end

  protected

  def pagination_attributes
    options.merge(
      'aria-label': "#{context.aria_label || 'Page navigation'}"
    )
  end

  def ul_classes
    [].tap do |classes|
      classes << "pagination"
      classes << "pagination-#{context.size}" if context.size.present?
    end.join(' ').strip
  end

end
