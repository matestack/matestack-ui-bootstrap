class Bootstrap::Components::Modal < Matestack::Ui::Component

  optional :m_title, :text, :close_btn_text, :fade,
            :fullscreen, :fullscreen_below, :size,
            :static, :modal_dialog_class, :scrollable, :centered,
            class: { as: :bs_class }, id: { as: :bs_id }

  def response 
    div modal_attributes do
      div class: dialog_classes do
        div class: "modal-content" do
          header_partial
          body_partial
          footer_partial
        end
      end
    end
  end

  protected

  def header_partial
    div class: "modal-header" do
      if options[:slots] && options[:slots][:header]
        slot options[:slots][:header]
      else
        heading size: 5, class: 'modal-title', text: m_title
        close dismiss: 'modal'
      end
    end
  end

  def body_partial
    div class: "modal-body" do
      paragraph text: text if text.present?
      yield_components if !text.present?
    end
  end

  def footer_partial
    div class: "modal-footer" do
      slot options[:slots][:footer] if options[:slots] && options[:slots][:footer]
      button class: "btn btn-secondary", data: { dismiss: 'modal' }, attributes: { type: 'button' }, text: close_btn_text if close_btn_text.present?
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
      classes << "modal-#{size}" if size.present?
      classes << 'modal-fullscreen' if fullscreen
      classes << "modal-fullscreen-#{fullscreen_below}-down" if fullscreen_below.present?
      classes << modal_dialog_class
    end.join(' ').strip
  end
end