class Matestack::Ui::Bootstrap::Form::Input < Matestack::Ui::VueJs::Components::Form::Input

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-input"

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
    div class: "matestack-ui-bootstrap-input" do
      label input_label, for: attribute_key,  class: "form-label" if input_label
      case context.type
      when :range
        input options.merge(input_attributes).merge(bootstrap_range_attributes)
        if context.show_value
          div id: attribute_key, class: "form-text" do
            plain "{{ data['#{attribute_key}'] }}"
          end
        end
      when :file
        file_input
      else
        input options.merge(input_attributes).merge(bootstrap_input_attributes)
        render_errors
      end
      render_form_text if context.form_text
    end
  end

  def bootstrap_input_attributes
    {
      id: (options[:id] || attribute_key),
      class: (options[:class] || "") << (" form-control"),
      disabled: context.disabled,
      min: context.min,
      max: context.max,
      step: context.step
    }
  end

  def bootstrap_range_attributes
    {
      class: (options[:class] || "") << (" form-range"),
      disabled: context.disabled,
      min: context.min,
      max: context.max,
      step: context.step
    }
  end

  def bootstrap_file_input_attributes
    {
      class: (options[:class] || "") << (" form-file-input"),
      disabled: context.disabled
    }
  end

  def form_file_wrapper_class
    case context.variant
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
      input options.merge(input_attributes).merge(bootstrap_file_input_attributes)
      label class: "form-file-label", for: attribute_key do
        span class: "form-file-text", "v-if": "data['#{attribute_key}']" do
          if context.multiple
            span "v-for": "file in data['#{attribute_key}']" do
              plain "{{ file['name'] }}"
            end
          else
            plain "{{ data['#{attribute_key}']['name'] }}"
          end
        end
        span class: "form-file-text", "v-if": "!data['#{attribute_key}']" do
          plain context.placeholder || "Choose file"
        end
        span class: "form-file-button" do
          plain context.browse_button_text || "Browse"
        end
      end
      render_errors
    end
  end

  def render_errors
    if display_errors?
      div class: 'invalid-feedback', 'v-for': "error in #{error_key}" do
        plain '{{ error }}'
      end
    end
  end

  def input_error_class
    'is-invalid'
  end

  def render_form_text
    div id: "form_text_for_#{attribute_key}", class: "form-text" do
      plain context.form_text
    end
  end

end
