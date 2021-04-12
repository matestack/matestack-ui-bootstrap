class Matestack::Ui::Bootstrap::Form::Switch < Matestack::Ui::Bootstrap::Form::Checkbox

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-checkbox"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-switch" do
      label input_label, class: "form-label", for: attribute_key if input_label && multiple?
      render_options
      render_errors
      plain context.form_text
      render_form_text if context.form_text
    end
  end

  private

  def checkbox_wrapper(options = {}, &block)
    wrapper_attributes = (options[:attributes] || {}).merge({
      class: "form-check form-switch #{'form-check-inline' if context.variant == :inline}"
    })
    div wrapper_attributes do
      yield if block_given?
    end
  end

end
