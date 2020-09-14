class Bootstrap::Components::ButtonGroup < Matestack::Ui::Component

  optional class: { as: :bs_class }
  optional label: { as: :bs_label }
  optional :type, :size, :vertical

  def response 
    div buttongroup_attributes do
      yield_components
    end
  end

  protected

  def buttongroup_attributes
    attributes = {}.tap do |hash|
      hash[:class] = buttongroup_classes
      hash[:attributes] = { role: "#{type.present? ? type : 'group'}", 'aria-label': bs_label } 
    end
    html_attributes.merge(
      attributes
    )
  end

  def buttongroup_classes
    [].tap do |classes|
      classes << (type.present? ? "btn-#{type}#{verti}" : "btn-group#{verti}")
      classes << "btn-group-#{size}" if size.present?
      classes << bs_class
    end.join(' ').strip
  end
  def verti 
    attrs = "-vertical" if vertical
  end
end