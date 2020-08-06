class Components::Container < Matestack::Ui::StaticComponent

  def prepare
    @container_classes = []

    options[:size].present? ? @container_classes << "container-#{options[:size]}" : @container_classes << "container"
    @container_classes << "#{options[:class]}" if options[:class].present?
  end

  def response 
    div id: "#{options[:id]}", class: "#{@container_classes.join(' ')}" do
      yield_components
    end
  end
end