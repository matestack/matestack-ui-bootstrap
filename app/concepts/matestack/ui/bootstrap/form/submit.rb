class Matestack::Ui::Bootstrap::Form::Submit < Matestack::Ui::Bootstrap::BaseComponent

  optional :button_variant
  optional :spinner_variant
  optional :text
  optional :loading_text
  optional :loading_class
  optional :size
  optional :class

  def response
    bs_btn type: "submit", size:context.size, class: "#{context.class}", variant: context.button_variant || :primary, "v-if": "!loading()" do
      plain context.text || "Submit"
    end
    bs_btn type: "submit", size: context.size, class: "#{context.class} #{context.loading_class}", variant: context.button_variant || :primary, disabled: true, "v-if": "loading()" do
      bs_spinner variant: spinner_variant || :light, size: :sm
      plain context.loading_text || "Loading..."
    end
  end

end
