class Components::Col < Matestack::Ui::StaticComponent

  def response 
    div id: "#{options[:id]}", class: "#{col_classes}" do
      yield_components
    end
  end

  protected

  def col_classes
    classes = []

    [:sm, :md, :lg, :xl, :xxl].each do |size| 
      classes << "col-#{size}-#{options[size]}" if options[size].present?
    end
    classes << "col-#{options[:default]}" if options[:default].present?

    [:order, :order_sm, :order_md, :order_lg, :order_xl, :order_xxl].each do |order| 
      classes << "#{order}-#{options[order]}".gsub('_', '-') if options[order].present?
    end

    [:offset, :offset_sm, :offset_md, :offset_lg, :offset_xl, :offset_xxl].each do |offset| 
      classes << "#{offset}-#{options[offset]}".gsub('_', '-') if options[offset].present?
    end

    classes << "align-self-#{options[:align_self]}" if options[:align_self].present?
    # for others option
    classes << "col" if classes.blank?

    #optional classes
    classes << @options[:class]
    classes.join(' ') 
  end
end