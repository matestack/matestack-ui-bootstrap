class Components::Spinner < Matestack::Ui::StaticComponent
  def response 
    div id: "#{@options[:id]}", class: "#{spinner_class}", attributes: { 'role':"status" } do
      span class: "sr-only", text: "Loading..."
    end
  end

  protected

  def spinner_class
    classes = []

    type = @options[:type].present? ? @options[:type].to_s : "border"
    classes << "spinner-#{type}" 

    color = @options[:color].to_s if @options[:color].present?
    classes << "text-#{color}" 

    classes << "spinner-#{type}-sm" if @options[:small].present? && @options[:small] == true
    #optional classes
    classes << @options[:class]
    classes.join(' ') 
  end

end