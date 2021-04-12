class Matestack::Ui::Bootstrap::Form::Submit < Matestack::Ui::Bootstrap::BaseComponent

  optional :button_variant
  optional :spinner_variant
  optional :loading_text
  optional :loading_class
  optional :size
  optional class: { as:  :bs_class }

  def response
    bs_btn type: "submit", size:context.size, class: "#{context.bs_class}", variant: context.button_variant || :primary, "v-if": "!loading" do
      plain context.text || "Submit"
    end
    bs_btn type: "submit", size: context.size, class: "#{context.bs_class} #{context.loading_class}", variant: context.button_variant || :primary, disabled: true, "v-if": "loading" do
      bs_spinner variant: context.spinner_variant || :light, size: :sm
      plain context.loading_text || "Loading..."
    end
  end

end
