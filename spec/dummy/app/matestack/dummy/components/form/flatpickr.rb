class Dummy::Components::Form::Flatpickr < Matestack::Ui::Bootstrap::Form::Input

  optional :form_text
  optional :disabled
  optional :enable_time
  optional :type

  vue_name "form-flatpickr-component"

  def vue_props
    {
      init_value: init_value,
      enable_time: context.enable_time
    }
  end

  def response
    # exactly one root element is required since this is a Vue.js component template
    div class: "form-flatpickr-component" do
      label input_label, ":for": id,  class: "form-label" if input_label
      input input_attributes.merge(bootstrap_flatpickr_input_attributes)
      render_errors
      render_form_text
    end
  end

  def bootstrap_flatpickr_input_attributes
    bootstrap_input_attributes.merge({
      type: :text,
      class: (options[:class] || "") << (" form-control flatpickr"),
      disabled:  context.disabled
    })
  end

end
