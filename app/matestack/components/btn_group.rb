class Components::BtnGroup < Matestack::Ui::StaticComponent

  def response 
    div id: "#{options[:id]}", class: "#{button_classes}", attributes: { 'role':"#{@options[:type]}", 'aria-label':"#{@options[:label]}" } do
      yield_components
    end
  end

  protected

  def button_classes
    classes = []
    [:group, :toolbar].each do |type|
      classes << "btn-#{type}#{vertical}" if @options[:type] == type && @options[:type].present?
    end
    # default
    classes << "btn-group" unless @options[:type].present?
    #btn size
    classes << "btn-group-#{button_sizes.at(@options[:size] - 1)}" if @options[:size].present?
    #optional classes
    classes << @options[:class]
    classes.join(' ')
  end

  def vertical 
    attrs = "-vertical" if @options[:vertical].present? && @options[:vertical] == true
    attrs
  end

  
  def button_sizes
    [:sm, :md, :lg]
  end
end