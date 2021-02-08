class Bootstrap::Form::Input < Matestack::Ui::Core::Form::Input::Input

  optional :form_text
  optional :disabled
  optional :browse_button_text
  optional :placeholder
  optional :variant
  optional :min
  optional :max
  optional :step
  optional :show_value

  def response
    div do
      label for: attr_key,  class: "form-label", text: input_label if input_label
      case type
      when :range
        input html_attributes.merge(attributes: vue_attributes).merge(bootstrap_range_attributes)
        if show_value
          div id: attr_key, class: "form-text" do
            plain "{{ data['#{attr_key}'] }}"
          end
        end
      when :file
        file_input
      else
        input html_attributes.merge(attributes: vue_attributes).merge(bootstrap_input_attributes)
        render_errors
      end
      render_form_text if form_text
    end
  end

  def vue_attributes
    (options[:attributes] || {}).merge({
      id: attr_key,
      "@change": change_event,
      ref: "input.#{attr_key}",
      'init-value': init_value,
      'v-bind:class': "{ '#{input_error_class}': #{error_key} }",
      "aria-describedby": attr_key,
      "step": "any"
    }).merge(
      type != :file ? { "#{v_model_type}": input_key } : {}
    ) # file inputs are readonly, no v-model possible
  end

  def bootstrap_input_attributes
    {
      class: (options[:class] || "") << (" form-control"),
      disabled: disabled
    }
  end

  def bootstrap_range_attributes
    {
      class: (options[:class] || "") << (" form-range"),
      disabled: disabled,
      min: min,
      max: max,
      steps: step
    }
  end

  def bootstrap_file_input_attributes
    {
      class: (options[:class] || "") << (" form-file-input"),
      disabled: disabled
    }
  end

  def form_file_wrapper_class
    case variant
    when :lg
      (options[:class] || "") << (" form-file form-file-lg")
    when :sm
      (options[:class] || "") << (" form-file form-file-sm")
    else
      (options[:class] || "") << (" form-file")
    end
  end

  def file_input
    div class: form_file_wrapper_class do
      input html_attributes.merge(attributes: vue_attributes).merge(bootstrap_file_input_attributes)
      label class: "form-file-label", for: attr_key do
        span class: "form-file-text", attributes: { "v-if": "data['#{attr_key}']" } do
          if multiple
            span attributes: { "v-for": "file in data['#{attr_key}']" } do
              plain "{{ file['name'] }}"
            end
          else
            plain "{{ data['#{attr_key}']['name'] }}"
          end
        end
        span class: "form-file-text", attributes: { "v-if": "!data['#{attr_key}']" } do
          plain placeholder || "Choose file"
        end
        span class: "form-file-button", text: browse_button_text || "Browse"
      end
      render_errors
    end
  end

  def render_errors
    unless @included_config[:errors] == false && (errors == false || errors.nil?) || errors == false
      div class: 'invalid-feedback', attributes: { 'v-for': "error in #{error_key}" } do
        plain '{{ error }}'
      end
    end
  end

  def input_error_class
    'is-invalid'
  end

  def render_form_text
    div id: "form_text_for_#{attr_key}", class: "form-text" do
      plain form_text
    end
  end

end
