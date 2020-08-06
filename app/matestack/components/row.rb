class Components::Row < Matestack::Ui::StaticComponent
  def prepare
    @row_classes = []

    @row_classes << "align-items-#{options[:vertical]}" if options[:vertical].present?
    @row_classes << "justify-content-#{options[:horizontal]}" if options[:horizontal].present?
    @row_classes << "#{options[:option]}" if options[:option].present?
  end

  def response 
    div id: "#{options[:id]}", class: "row #{@row_classes.join(' ')}" do
      yield_components
    end
  end
end