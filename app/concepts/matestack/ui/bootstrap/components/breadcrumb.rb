class Matestack::Ui::Bootstrap::Components::Breadcrumb < Matestack::Ui::Component

  optional :items # list of items  with path and text
  optional :class # adding custom class to breadcrumb list
  optional :nav_class

  def response
    nav class: context.nav_class, "aria-label": "breadcrumb" do
      ol breadcrumb_attributes do
        context.items&.each_with_index do |item, index|
          li link_attrs((context.items.size - 1) == index) do
            case item[:type]
            when :link
              link item
            when :transition
              transition item
            else
              plain item[:text]
            end
          end
        end
        yield
      end
    end
  end

  protected

  def link_attrs(last = false)
    {}.tap do |hash|
      hash[:class] = "breadcrumb-item #{'active' if last}"
      hash["aria-current"] = "page" if last
    end
  end

  def breadcrumb_attributes
    options.merge(
      class: breadcrumb_classes
    )
  end

  def breadcrumb_classes
    [].tap do |classes|
      classes << "breadcrumb"
      classes << context.class
    end.join(' ').strip
  end
end
