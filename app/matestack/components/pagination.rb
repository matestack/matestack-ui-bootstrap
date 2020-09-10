class Components::Pagination < Matestack::Ui::StaticComponent
  
  optional class: { as: :bs_class }, label: { as: :bs_label }
  optional :items, :size, :items_id, :items_class, :text

  def response 
    nav pagination_attributes do
      ul ul_attributes do
        if items.present? && items.length() >= 1
          items.each_with_index do |(text, path), index|
            li class: "page-item #{'active' if path == request.fullpath }" do
              link class: "page-link", path: path do
                plain text
              end
            end
          end
        else
          # insert custom list
          yield_components
        end
      end
    end
  end

  protected

  def pagination_attributes
    html_attributes.merge(
      class: pagination_classes,
      attributes: { 'aria-label': "#{bs_label}" }
    )
  end

  def pagination_classes
    [].tap do |classes|
      classes << bs_class
    end.join(' ').strip
  end

  def ul_attributes
    {}.tap do |hash| 
      hash[:id] = items_id
      hash[:class] = ul_classes
    end
  end

  def ul_classes
    [].tap do |classes|
      classes << "pagination"
      classes << "pagination-#{size}" if size.present? 
      classes << items_class
    end.join(' ').strip
  end

end