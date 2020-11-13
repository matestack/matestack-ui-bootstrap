class Bootstrap::Form::Submit < Matestack::Ui::Component

  optional :button_variant
  optional :spinner_variant
  optional :text
  optional :loading_text

  def response
    form_submit do
      btn variant: button_variant || :primary, attributes: { "v-if": "!loading" } do
        plain text || "Submit"
      end
      btn variant: button_variant || :primary, attributes: { disabled: true, "v-if": "loading" } do
        spinner variant: spinner_variant || :light, size: :sm
        plain loading_text || "Loading..."
      end
    end
  end

end
