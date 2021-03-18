class Matestack::Ui::Bootstrap::Layout::Row < Matestack::Ui::Bootstrap::BaseComponent

  optional :vertical
  optional :horizontal
  optional :class

  def response 
    div options.merge(class: row_classes) do
      yield if block_given?
    end
  end

  def row_classes
    classes = ["row"]

    classes << "align-items-#{context.vertical}" if context.vertical.present?
    classes << "justify-content-#{context.horizontal}" if context.horizontal.present?
    classes << "#{context.class}" if context.class.present?

    classes.join(' ')
  end
end