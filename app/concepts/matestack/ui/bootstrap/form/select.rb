class Matestack::Ui::Bootstrap::Form::Select < Matestack::Ui::Core::Form::Select::Base

  vue_js_component_name "matestack-ui-core-form-select"

  optional :variant
  optional :size
  optional :form_text

  def response
    div class: "matestack-ui-bootstrap-form-select" do
      label for: attr_key,  class: "form-label", text: input_label if input_label
      select select_attributes.merge({ id: (options[:id] || attr_key), class: form_select_class, size: size_class }) do
        render_options
      end
      render_errors
      render_form_text
    end
  end

  def form_select_class
    case variant
    when :lg
      (options[:class] || "") << (" form-select form-select-lg")
    when :sm
      (options[:class] || "") << (" form-select form-select-sm")
    else
      (options[:class] || "") << (" form-select")
    end
  end

  def size_class
    size
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
