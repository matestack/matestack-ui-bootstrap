class Bootstrap::Components::Modal < Matestack::Ui::VueJsComponent
  vue_js_component_name 'matestack-ui-bootstrap-modal'

  # header attributes, expects a hash or string
  # possible keys `:class, :text, :size`
  optional :header 
  # body attributes, expects a hash or string
  # possible keys `:class, :text`
  optional :body
  # footer is a dismiss button, expects a hash or string for button text
  # possible keys `:class, :text`
  optional :footer 
  optional :fade, :size
  optional :fullscreen # fullscreen attribute, expects boolean or bootstrap breakpoint
  optional :static, :keyboard, :scrollable, :centered
  optional :modal_dialog_class, class: { as: :bs_class }, id: { as: :bs_id }
  # event trigger
  optional :toggle_on, :show_on, :hide_on, :handle_update_on, :dispose_on

  optional :slots

  def response 
    div modal_attributes do
      div class: dialog_classes do
        div class: "modal-content" do
          header_partial if header || (slots && slots[:header])
          body_partial if body || slots && slots[:body]
          footer_partial if footer || (slots && slots[:footer])
          yield_components
        end
      end
    end
  end

  protected

  def header_partial
    header = self.header.is_a?(Hash) ? self.header : { text: self.header }
    div class: "modal-header" do
      if slots && slots[:header]
        slot slots[:header] 
      else
        heading size: (header[:size] || 5), class: "modal-title #{header[:class]}", text: header[:text] if header[:text].present?
        close dismiss: 'modal'
      end
    end
  end

  def body_partial
    body = self.body.is_a?(Hash) ? self.body : { text: self.body }
    div class: "modal-body #{body[:class]}".strip do
      if slots && slots[:body]
        slot slots[:body] 
      else
        plain body[:text] if body[:text].present?
      end
    end
  end

  def footer_partial
    footer = self.footer.is_a?(Hash) ? self.footer : { text: self.footer }
    div class: "modal-footer" do
      slot slots[:footer] if slots && slots[:footer]
      if footer[:text].present?
        button class: "btn #{footer[:class].present? ? footer[:class] : 'btn-secondary'}", 
          data: { dismiss: 'modal' }, attributes: { type: 'button' }, 
          text: footer[:text] 
      end
    end
  end

  def modal_attributes
    attributes = {}.tap do |hash|
      hash[:class] = modal_classes
      hash[:attributes] = { 'tabindex': "-1", 'aria-labelledby': "#{bs_id}Label", 'aria-hidden': "true" }
      hash[:data] = {}.tap do |data| 
        data[:backdrop] = "static" if static
        data[:keyboard] = "false" if keyboard
      end
    end
    html_attributes.merge(
      attributes
    )
  end

  def modal_classes
    [].tap do |classes|
      classes << 'modal'
      classes << 'fade' if fade || !fade.present?
      classes << bs_class
    end.join(' ').strip
  end

  def dialog_classes
    [].tap do |classes|
      classes << 'modal-dialog'
      classes << 'modal-dialog-centered' if centered
      classes << 'modal-dialog-scrollable' if scrollable
      classes << "modal-#{size}" if size
      if fullscreen.present?
        classes << (fullscreen == true ? 'modal-fullscreen' : "modal-fullscreen-#{fullscreen}-down")
      end
      classes << modal_dialog_class
    end.join(' ').strip
  end
end