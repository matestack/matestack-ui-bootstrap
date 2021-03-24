class Matestack::Ui::Bootstrap::Components::Modal < Matestack::Ui::Bootstrap::BaseVueJsComponent
  vue_name 'matestack-ui-bootstrap-modal'

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
  optional :modal_dialog_class 
  optional :id
  # event trigger
  optional :toggle_on, :show_on, :hide_on, :handle_update_on, :dispose_on

  

  def response
    div modal_attributes do
      div class: dialog_classes do
        div class: "modal-content" do
          header_partial if context.header || (slots && slots[:header])
          body_partial if context.body || slots && slots[:body]
          footer_partial if context.footer || (slots && slots[:footer])
          yield if block_given?
        end
      end
    end
  end

  protected

  def config
    {}.tap do |props|
      props[:toggle_on] = context.toggle_on
      props[:show_on] = context.show_on
      props[:hide_on] = context.hide_on
      props[:handle_update_on] = context.handle_update_on
      props[:dispose_on] = context.dispose_on
    end
  end

  def header_partial
    header = context.header.is_a?(Hash) ? context.header : { text: context.header }
    div class: "modal-header" do
      if slots && slots[:header]
        slot :header
      else
        heading header[:text], size: (header[:size] || 5), class: "modal-title #{header[:class]}" if header[:text].present?
        bs_close dismiss: 'modal'
      end
    end
  end

  def body_partial
    body = context.body.is_a?(Hash) ? context.body : { text: context.body }
    div class: "modal-body #{body[:class]}".strip do
      if slots && slots[:body]
        slot :body
      else
        plain body[:text] if body[:text].present?
      end
    end
  end

  def footer_partial
    footer = context.footer.is_a?(Hash) ? context.footer : { text: context.footer }
    div class: "modal-footer" do
      slot :footer if slots && slots[:footer]
      if footer[:text].present?
        button class: "btn #{footer[:class].present? ? footer[:class] : 'btn-secondary'}",
          data: { "bs-dismiss": 'modal' }, type: 'button' do
            plain footer[:text]
          end
      end
    end
  end

  def modal_attributes
    attributes = {}.tap do |hash|
      hash[:id] = context.id
      hash[:class] = modal_classes
      hash[:attributes] = { 'tabindex': "-1", 'aria-labelledby': "#{context.id}Label", 'aria-hidden': "true" }
      hash[:data] = {}.tap do |data|
        data[:backdrop] = "static" if context.static
        data[:keyboard] = "false" if context.keyboard
      end
    end
    options.merge(
      attributes
    )
  end

  def modal_classes
    [].tap do |classes|
      classes << 'modal'
      classes << 'fade' if context.fade || !context.fade.present?
      classes << context.bs_class
    end.join(' ').strip
  end

  def dialog_classes
    [].tap do |classes|
      classes << 'modal-dialog'
      classes << 'modal-dialog-centered' if context.centered
      classes << 'modal-dialog-scrollable' if context.scrollable
      classes << "modal-#{context.size}" if context.size
      if context.fullscreen.present?
        classes << (context.fullscreen == true ? 'modal-fullscreen' : "modal-fullscreen-#{context.fullscreen}-down")
      end
      classes << context.modal_dialog_class
    end.join(' ').strip
  end
end
