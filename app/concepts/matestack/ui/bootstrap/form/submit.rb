class Matestack::Ui::Bootstrap::Form::Submit < Matestack::Ui::Component

  optional :button_variant
  optional :spinner_variant
  optional :text
  optional :loading_text
  optional :loading_class

  def response
    form_submit do
      bs_btn type: "submit", size: options[:size], class: "#{options[:class]}", variant: button_variant || :primary, attributes: { "v-if": "!loading()" } do
        plain text || "Submit"
      end
      bs_btn type: "submit", size: options[:size], class: "#{loading_class}", variant: button_variant || :primary, attributes: { disabled: true, "v-if": "loading()" } do
        bs_spinner variant: spinner_variant || :light, size: :sm
        plain loading_text || "Loading..."
      end
    end
  end

end
