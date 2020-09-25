class Bootstrap::Components::Toast < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-toast" 

  # header attributes, expects a hash or string
  # possible keys `:icon_class, :icon, :title, :subtitle`
  optional :header
  # body expects a string as message inside toast
  optional :body
  optional :t_style
  optional :important, :delay, :autohide, :animation
  optional class: { as: :bs_class }, attributes: { as: :bs_attrs }, data: { as: :bs_data }
  optional :slots

  def response 
    div toast_attributes do
      header_partial if header || slots && slots[:header]
      body_partial
    end
  end

  protected

  def header_partial
    header = self.header.is_a?(Hash) ? self.header : { text: self.header }
    div class: "toast-header" do
      img class: "#{'rounded mr-2' || header[:icon_class]}", path: header[:icon] if header[:icon].present?
      strong class: "mr-auto", text: header[:title] if header[:title].present?
      small text: header[:subtitle] if header[:subtitle].present?
      
      slot slots[:header] if slots && slots[:header]
      close dismiss: 'toast', class: "ml-2 mb-1"
    end

  end

  def body_partial
    div class: "toast-body" do
      paragraph text: body if body
      yield_components
    end
  end

  def toast_attributes
    html_attributes.merge(
      class: toast_classes,
      attributes: toast_attrs,
      data: toast_data
    )
  end

  def toast_data
    (bs_data || {}).tap do |hash|
      hash[:delay] = delay.nil? ? 500 : delay
      hash[:autohide] = autohide.nil? ? "true" : "#{autohide}"
      hash[:animation] = animation.nil? ? "true" : "#{animation}"
    end
  end

  def toast_attrs 
    (bs_attrs || {}).tap do |hash|
      hash[:role] = 'alert'
      hash[:'aria-live'] = (important ? 'assertive' : 'polite') if !t_style.present? && important.present?
      hash[:'aria-live'] = 'assertive' if !t_style.present? && !important.present?
      hash[:'aria-atomic'] = 'true' if !t_style.present?
      hash[:style] = t_style if t_style.present?
    end
  end

  def toast_classes
    [].tap do |classes|
      classes << 'toast p-0'
      classes << bs_class
    end.join(' ').strip
  end
end