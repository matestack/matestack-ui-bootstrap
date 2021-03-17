class Matestack::Ui::Bootstrap::Components::ButtonGroup < Matestack::Ui::Component

  optional :class
  optional :label
  optional :toolbar, :size, :vertical

  def response 
    div buttongroup_attributes do
      yield
    end
  end

  protected

  def buttongroup_attributes
    attributes = {}.tap do |hash|
      hash[:class] = buttongroup_classes
      hash[:role] = "#{context.toolbar ? :toolbar : :group}"
      hash["aria-label"] = 'aria-label': context.label  
    end
    options.merge(
      attributes
    )
  end

  def buttongroup_classes
    [].tap do |classes|
      classes << ("btn-#{context.toolbar ? :toolbar : :group}#{'-vertical' if context.vertical}")
      classes << "btn-group-#{context.size}" if context.size.present?
      classes << context.class
    end.join(' ').strip
  end

end