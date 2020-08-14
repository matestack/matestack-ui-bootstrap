class Components::Container < Matestack::Ui::StaticComponent

  def response 
    div id: "#{options[:id]}", class: "#{container_classes}" do
      yield_components
    end
  end

  protected
  
  def container_classes
    classes = []

    @options[:size].present? ? classes << "container-#{@options[:size]}" : classes << "container"

    #optional classes
    classes << @options[:class]
    classes.join(' ') 
  end
end