class Matestack::Ui::Bootstrap::Layout::Container < Matestack::Ui::Component

  optional :size, :class

  def response 
    div container_attributes do
      yield
    end
  end

  protected
  
  def container_attributes
    options.merge(
      class: container_classes
    )
  end

  def container_classes
    [].tap do |classes|
      classes << (size.present? ? "container-#{size}" : "container")
      classes << context.class
    end.join(' ').strip
  end
end