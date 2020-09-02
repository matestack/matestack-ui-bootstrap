class Components::Dynamic::Toasts < Matestack::Ui::VueJsComponent
  vue_js_component_name "matestack-ui-bootstrap-toasts" 

  optional :icon_class, :icon_path, :t_title, :t_text, :message, :t_style, 
            :important, :delay, :autohide, :animation,
            class: { as: :bs_class }, attributes: { as: :bs_attrs }, data: { as: :bs_data }

  # TODO: How to trigger show methods?
  def setup
    @component_config["toasts-id"] = toasts_id
  end

  def response 
    div toast_attributes do
      div class: "toast-header" do
        if options[:slots] && options[:slots][:header]
          custom_header_partial
        else
          header_partial
        end
      end
      body_partial
    end
  end

  protected

  def custom_header_partial
    slot options[:slots][:header]
  end

  def header_partial
    img class: icon_classes, path: icon_path if icon_path.present?
    strong class: "mr-auto", text: t_title if t_title.present?
    small text: t_text if t_text.present?
    button class: "ml-2 mb-1 close", data: { dismiss: "toast" },
            attributes: { 'aria-label':'Close', 'type':'button' } do
      span attributes: { 'aria-hidden':'true' } do plain "&times;".html_safe end
    end
  end

  def body_partial
    div class: "toast-body" do
      yield_components if !message.present?
      paragraph text: message if message.present?
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
      hash[:delay] = delay if delay.present?
      hash[:autohide] = autohide if autohide.present?
      hash[:animation] = animation if animation.present?
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
      classes << 'toast'
      # custom classes
      classes << bs_class
    end.join(' ').strip
  end

  def icon_classes
    [].tap do |classes|
      classes << 'rounded mr-2' if !icon_class.present?
      classes << icon_class if icon_class.present?
    end.join(' ').strip
  end

  def toasts_id
    @toast_id ||= "matestack-alert-#{SecureRandom.hex}"
  end
end