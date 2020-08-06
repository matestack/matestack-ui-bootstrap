class Components::Col < Matestack::Ui::StaticComponent
  def prepare
    @col_classes = []

    [:xs, :sm, :md, :lg, :xl, :xxl].each do |size| 
      @col_classes << "col-#{size}-#{options[size]}" if options[size].present?
    end
    @col_classes << "col-#{options[:default]}" if options[:default].present?

    [:order, :order_xs, :order_sm, :order_md, :order_lg, :order_xl, :order_xxl].each do |order| 
      @col_classes << "#{order}-#{options[order]}".gsub('_', '-') if options[order].present?
    end

    [:offset, :offset_xs, :offset_sm, :offset_md, :offset_lg, :offset_xl, :offset_xxl].each do |offset| 
      @col_classes << "#{offset}-#{options[offset]}".gsub('_', '-') if options[offset].present?
    end

    @col_classes << "align-self-#{options[:align_self]}" if options[:align_self].present?
    @col_classes << "#{options[:option]}" if options[:option].present?
    @col_classes << "col" if @col_classes.blank?
  end

  def response 
    div id: "#{options[:id]}", class: "#{@col_classes.join(' ')}" do
      yield_components
    end
  end
end