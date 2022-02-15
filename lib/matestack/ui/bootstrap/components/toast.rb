require_relative "../base_vue_js_component"

class Matestack::Ui::Bootstrap::Components::Toast < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name "matestack-ui-bootstrap-toast"

  # header attributes, expects a hash or string
  # possible keys `:icon_class, :icon, :title, :subtitle`
  optional :header
  # body expects a string as message inside toast
  optional :body
  # placement attributes, expects a hash wiht possible keys: position, min-height
  optional :placement # for adding custom css style
  optional :important, :delay, :autohide, :animation
  optional class: { as:  :bs_class }
  optional :attributes, :data


  optional :show_on, :hide_on, :dispose_on

  def response
    standard_placement_partial
    # standard_placement_partial unless placement.present?
    # custom_placement_partial if placement.present?
  end

  protected

  def vue_props
    {}.tap do |props|
      props[:delay] = context.delay
      props[:autohide] = context.autohide
      props[:show_on] = context.show_on
      props[:hide_on] = context.hide_on
      props[:dispose_on] = context.dispose_on
    end
  end

  def custom_placement_partial
    div placement_attrs do
      standard_placement_partial
    end
  end

  def standard_placement_partial
    div toast_attributes do
      header_partial if context.header || slots && slots[:header]
      body_partial
    end
  end

  def header_partial
    header = context.header.is_a?(Hash) ? context.header : { title: context.header }
    div class: "toast-header" do
      img class: "#{'rounded me-2' || header[:icon_class]}", path: header[:icon] if header[:icon].present?
      strong header[:title], class: "me-auto" if header[:title].present?
      small header[:subtitle] if header[:subtitle].present?

      slot :header if slots && slots[:header]
      bs_close dismiss: 'toast', class: "ms-2 mb-1", "@click": "vc.hide()"
    end

  end

  def body_partial
    div class: "toast-body" do
      plain context.body if context.body
    end
    unless context.header || slots && slots[:header]
      bs_close dismiss: 'toast', class: "ms-auto me-2 btn-close-white", "@click": "vc.hide()"
    end
  end

  def toast_attributes
    options.merge(
      class: toast_classes,
      data: toast_data
    ).merge(toast_attrs)
  end

  def toast_data
    (context.data || {}).tap do |hash|
      hash["bs-delay"] = context.delay.nil? ? 5000 : context.delay
      hash["bs-autohide"] = context.autohide.nil? ? "true" : "#{context.autohide}"
      hash["bs-animation"] = context.animation.nil? ? "true" : "#{context.animation}"
    end
  end

  def toast_attrs
    (context.attributes || {}).tap do |hash|
      hash[:role] = (context.important == false ? 'status' : 'alert')
      hash[:'aria-live'] = (context.important ? 'assertive' : 'polite') if context.important.present? && !context.placement.present?
      hash[:'aria-live'] = 'assertive' unless context.important.present?
      hash[:'aria-atomic'] = 'true' unless context.placement.present?
      hash[:style] = "z-index: 10000; position: fixed; #{context.placement[:position] || 'top: 0; right: 0;' }"  if context.placement.present?
      hash[:"v-bind:class"] = "{'show' : vc.showing }"
    end
  end

  def toast_classes
    [].tap do |classes|
      classes << 'toast p-0 fade d-flex align-items-center border-0'
      classes << context.bs_class
    end.join(' ').strip
  end

  def placement_attrs
    {}.tap do |hash|
      hash[:'aria-live'] = (context.important ? 'assertive' : 'polite') if context.important.present?
      hash[:'aria-atomic'] = 'true'
      hash[:style] = "position: relative; min-height: #{context.placement[:height]};"
    end
  end
end
