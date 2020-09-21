class Bootstrap::Components::Breadcrumb < Matestack::Ui::Component

  optional :items # list of items  with path and text
  optional class: { as: :bs_class} # adding custom class to breadcrumb list

  def response 
    nav attributes: { 'aria-label': "breadcrumb" } do
      ol breadcrumb_attributes do    
        if items.present?
          items.each_with_index do |item, index|
            li link_attrs((items.size - 1) == index) do
              case item[:type]
              when :link
                link path: item[:path], text: item[:text]
              else
                transition path: item[:path], text: item[:text]
              end
            end
          end
        else
          yield_components 
        end
      end
    end
  end

  protected

  def link_attrs(last = false)
    {}.tap do |hash|
      hash[:class] = "breadcrumb-item #{'active' if last}"
      hash[:attributes] = { 'aria-current': "page" } if last
    end
  end

  def breadcrumb_attributes
    html_attributes.merge(
      class: breadcrumb_classes
    )
  end

  def breadcrumb_classes
    [].tap do |classes|
      classes << "breadcrumb"
      classes << bs_class
    end.join(' ').strip
  end
end