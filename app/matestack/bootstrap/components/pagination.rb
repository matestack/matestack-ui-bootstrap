class Bootstrap::Components::Pagination < Matestack::Ui::Component
  
  optional :aria_label, :size, class: { as: :bs_class }
  optional :items

  def response 
    nav pagination_attributes do
      ul class: ul_classes do
        if items.present?
          items.each_with_index do |item, index|
            li class: "page-item #{'active' if item[:active]}" do
              if item[:type] == :link
                link path: path, text: item[:text], class: 'page-link'
              else
                transition path: path, text: item[:text], class: 'page-link'
              end
            end
          end
        end
        yield_components
      end
    end
  end

  protected

  def pagination_attributes
    html_attributes.merge(
      attributes: { 'aria-label': "#{bs_label || 'Page navigation'}" }
    )
  end

  def ul_classes
    [].tap do |classes|
      classes << "pagination"
      classes << "pagination-#{size}" if size.present?
    end.join(' ').strip
  end

end