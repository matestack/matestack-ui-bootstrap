class Bootstrap::Components::Toast < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-toast"

  # header attributes, expects a hash or string
  # possible keys `:icon_class, :icon, :title, :subtitle`
  optional :header
  # body expects a string as message inside toast
  optional :body
  # placement attributes, expects a hash wiht possible keys: position, min-height
  optional :placement # for adding custom css style
  optional :important, :delay, :autohide, :animation
  optional class: { as: :bs_class }, attributes: { as: :bs_attrs }, data: { as: :bs_data }
  optional :slots

  def response
    standard_placement_partial
    # standard_placement_partial unless placement.present?
    # custom_placement_partial if placement.present?
  end

  protected

  def custom_placement_partial
    div attributes: placement_attrs do
      standard_placement_partial
    end
  end

  def standard_placement_partial
    div toast_attributes do
      header_partial if header || slots && slots[:header]
      body_partial
    end
  end

  def header_partial
    header = self.header.is_a?(Hash) ? self.header : { title: self.header }
    div class: "toast-header" do
      img class: "#{'rounded mr-2' || header[:icon_class]}", path: header[:icon] if header[:icon].present?
      strong class: "mr-auto", text: header[:title] if header[:title].present?
      small text: header[:subtitle] if header[:subtitle].present?

      slot slots[:header] if slots && slots[:header]
      close dismiss: 'toast', class: "ml-2 mb-1", attributes: { "@click": "hide()"}
    end

  end

  def body_partial
    div class: "toast-body" do
      plain body if body
    end
    unless header || slots && slots[:header]
      close dismiss: 'toast', class: "ml-auto mr-2 btn-close-white", attributes: { "@click": "hide()"}
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
      hash[:delay] = delay.nil? ? 5000 : delay
      hash[:autohide] = autohide.nil? ? "true" : "#{autohide}"
      hash[:animation] = animation.nil? ? "true" : "#{animation}"
    end
  end

  def toast_attrs
    (bs_attrs || {}).tap do |hash|
      hash[:role] = (important == false ? 'status' : 'alert')
      hash[:'aria-live'] = (important ? 'assertive' : 'polite') if important.present? && !placement.present?
      hash[:'aria-live'] = 'assertive' unless important.present?
      hash[:'aria-atomic'] = 'true' unless placement.present?
      hash[:style] = "position: fixed; #{placement[:position] || 'top: 0; right: 0;' }"  if placement.present?
      hash["v-bind:class"] = "{'show' : showing }"
    end
  end

  def toast_classes
    [].tap do |classes|
      classes << 'toast p-0 fade d-flex align-items-center border-0'
      classes << bs_class
    end.join(' ').strip
  end

  def placement_attrs
    {}.tap do |hash|
      hash[:'aria-live'] = (important ? 'assertive' : 'polite') if important.present?
      hash[:'aria-atomic'] = 'true'
      hash[:style] = "position: relative; min-height: #{placement[:height]};"
    end
  end
end
