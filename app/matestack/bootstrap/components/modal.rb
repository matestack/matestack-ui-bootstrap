class Bootstrap::Components::Modal < Matestack::Ui::Component

  # header attributes, expects a hash or string
  # possible keys `:class, :text, :size`
  optional :header 
  # footer attributes, expects a hash or string
  # possible keys `:class, :text`
  optional :body
  # footer is a dismiss button, expects a hash or string for button text
  # possible keys `:class, :text`
  optional :footer 

  optional :fullscreen # fullscreen attribute, expects boolean or bootstrap breakpoint
  
  optional :fade, :size
  optional :static, :modal_dialog_class, :scrollable, :centered
  optional class: { as: :bs_class }, id: { as: :bs_id }

  optional :slots

  def response 
    div modal_attributes do
      div class: dialog_classes do
        div class: "modal-content" do
          header_partial if header || (slots && slots[:header])
          body_partial 
          footer_partial if footer || (slots && slots[:footer])
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
    div class: "modal-body #{body[:class] if body[:class].present?}" do
      plain body[:text] if body[:text].present?
      yield_components
    end
  end

  def footer_partial
    footer = self.footer.is_a?(Hash) ? self.footer : { text: self.footer }
    div class: "modal-footer" do
      slot slots[:footer] if slots && slots[:footer]
      button class: "btn #{footer[:class].present? ? footer[:class] : 'btn-secondary'}", data: { dismiss: 'modal' }, attributes: { type: 'button' }, text: footer[:text] if footer[:text].present?
    end
  end

  def modal_attributes
    attributes = {}.tap do |hash|
      hash[:class] = modal_classes
      hash[:attributes] = { 'tabindex': "-1", 'aria-labelledby': "#{bs_id}Label", 'aria-hidden': "true" }
      hash[:data] = { backdrop: "static", keyboard: "false" } if static
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