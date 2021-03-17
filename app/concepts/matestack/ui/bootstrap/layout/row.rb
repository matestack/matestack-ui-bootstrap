class Matestack::Ui::Bootstrap::Layout::Row < Matestack::Ui::Component
  def prepare
    @row_classes = []

    @row_classes << "align-items-#{options[:vertical]}" if options[:vertical].present?
    @row_classes << "justify-content-#{options[:horizontal]}" if options[:horizontal].present?
    @row_classes << "#{options[:class]}" if options[:class].present?
  end

  def response 
    div id: "#{options[:id]}", class: "row #{@row_classes.join(' ')}" do
      yield
    end
  end
end