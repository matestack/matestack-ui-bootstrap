require_relative "../base_component"

class Matestack::Ui::Bootstrap::Layout::Container < Matestack::Ui::Bootstrap::BaseComponent

  optional :size

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
      classes << (context.size.present? ? "container-#{context.size}" : "container")
      classes << options[:class]
    end.join(' ').strip
  end

end
