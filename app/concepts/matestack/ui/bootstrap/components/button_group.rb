class Matestack::Ui::Bootstrap::Components::ButtonGroup < Matestack::Ui::Component

  optional class: { as: :bs_class }
  optional label: { as: :bs_label }
  optional :toolbar, :size, :vertical

  def response 
    div buttongroup_attributes do
      yield_components
    end
  end

  protected

  def buttongroup_attributes
    attributes = {}.tap do |hash|
      hash[:class] = buttongroup_classes
      hash[:attributes] = { 
        role: "#{toolbar ? :toolbar : :group}", 
        'aria-label': bs_label 
      } 
    end
    html_attributes.merge(
      attributes
    )
  end

  def buttongroup_classes
    [].tap do |classes|
      classes << ("btn-#{toolbar ? :toolbar : :group}#{'-vertical' if vertical}")
      classes << "btn-group-#{size}" if size.present?
      classes << bs_class
    end.join(' ').strip
  end

end