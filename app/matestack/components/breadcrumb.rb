class Components::Breadcrumb < Matestack::Ui::StaticComponent

  optional :items # list of items  with path and text
  optional class: { as: :bs_class} # adding custom class to breadcrumb list

  def response 
    nav  do
      ol breadcrumb_attributes do        
        yield_components
      end
    end
  end

  protected

  def breadcrumb_attributes
    html_attributes.merge(
      class: breadcrumb_classes
    )
  end

  def breadcrumb_classes
    [].tap do |classes|

      classes << bs_class
    end.join(' ').strip
  end
end