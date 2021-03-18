class Matestack::Ui::Bootstrap::Layout::Column < Matestack::Ui::Bootstrap::BaseComponent

  COL_ATTRIBUTES = %i[default sm md lg xl xxl]
  optional *COL_ATTRIBUTES

  ORDER_ATTRIBUTES = %i[order order_sm order_md order_lg order_xl order_xxl]
  optional *ORDER_ATTRIBUTES

  OFFSET_ATTRIBUTES = %i[offset offset_sm offset_md offset_lg offset_xl offset_xxl]
  optional *OFFSET_ATTRIBUTES

  optional :class
  optional :align_self

  def response 
    div col_attributes do
      yield if block_given?
    end
  end

  protected

  def col_attributes
    options.merge(
      class: col_classes
    )
  end

  def col_classes
    classes = []      
    COL_ATTRIBUTES.each do |attrs| 
      classes << "col-#{ context.send("#{attrs}") }" if attrs == :default and context.send("#{attrs}")
      classes << "col-#{attrs}-#{ context.send("#{attrs}") }" if attrs != :default and context.send("#{attrs}")
    end
    ORDER_ATTRIBUTES.each do |attrs| 
      classes << "#{attrs}-#{ context.send("#{attrs}") }".gsub('_', '-') if context.send("#{attrs}")
    end
    OFFSET_ATTRIBUTES.each do |attrs| 
      classes << "#{attrs}-#{ context.send("#{attrs}") }".gsub('_', '-') if context.send("#{attrs}")
    end
    classes << "align-self-#{context.align_self}" if context.align_self.present?
    classes << "col" if classes.blank?
    classes << context.class
    classes.join(' ').strip
  end
end