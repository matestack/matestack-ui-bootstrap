class Components::Col < Matestack::Ui::StaticComponent

  COL_ATTRIBUTES = %i[default sm md lg xl xxl]
  optional *COL_ATTRIBUTES

  ORDER_ATTRIBUTES = %i[order order_sm order_md order_lg order_xl order_xxl]
  optional *ORDER_ATTRIBUTES

  OFFSET_ATTRIBUTES = %i[offset offset_sm offset_md offset_lg offset_xl offset_xxl]
  optional *OFFSET_ATTRIBUTES

  optional class: { as: :bs_class }
  optional :align_self

  def response 
    div col_attributes do
      yield_components
    end
  end

  protected

  def col_attributes
    html_attributes.merge(
      class: col_classes
    )
  end

  def col_classes
    classes = []      
    COL_ATTRIBUTES.each do |attrs| 
      classes << "col-#{ self.send(:"#{attrs}") }" if attrs == :default and self.send(:"#{attrs}")
      classes << "col-#{attrs}-#{ self.send(:"#{attrs}") }" if attrs != :default and self.send(:"#{attrs}")
    end
    ORDER_ATTRIBUTES.each do |attrs| 
      classes << "#{attrs}-#{ self.send(:"#{attrs}") }".gsub('_', '-') if self.send(:"#{attrs}")
    end
    OFFSET_ATTRIBUTES.each do |attrs| 
      classes << "#{attrs}-#{ self.send(:"#{attrs}") }".gsub('_', '-') if self.send(:"#{attrs}")
    end
    classes << "align-self-#{align_self}" if align_self.present?
    classes << "col" if classes.blank?
    classes << bs_class
    classes.join(' ').strip
  end
end