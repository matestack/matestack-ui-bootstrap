class Matestack::Ui::Bootstrap::Form::Switch < Matestack::Ui::Bootstrap::Form::Checkbox

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-checkbox"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-switch" do
      label input_label, class: "form-label", for: attribute_key if input_label && context.multiple?
      render_options
      render_errors
      render_form_text unless context.form_text.nil? # otherwise renders empty div
    end
  end

  private

  def checkbox_wrapper(options = {}, &block)
    div class: "form-check form-switch #{'form-check-inline' if context.variant == :inline}", options[:attributes] do
      yield if block_given?
    end
  end

end
