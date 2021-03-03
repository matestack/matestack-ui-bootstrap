class Dummy::Components::Form::Flatpickr < Matestack::Ui::Bootstrap::Form::Input

  optional :form_text
  optional :disabled
  optional :enable_time
  optional :type

  vue_js_component_name "form-flatpickr-component"

  def setup
    @component_config[:init_value] = init_value
    @component_config[:enable_time] = enable_time
  end

  def response
    # exactly one root element is required since this is a Vue.js component template
    div class: "form-flatpickr-component" do
      label for: attr_key,  class: "form-label", text: input_label if input_label
      input input_attributes.merge(bootstrap_flatpickr_input_attributes)
      render_errors
      render_form_text
    end
  end

  def bootstrap_flatpickr_input_attributes
    bootstrap_input_attributes.merge({
      type: :text,
      class: (options[:class] || "") << (" form-control flatpickr"),
      disabled: disabled
    })
  end

end
