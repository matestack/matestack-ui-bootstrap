class Matestack::Ui::Bootstrap::Form::Select < Matestack::Ui::Core::Form::Select::Select

  optional :variant
  optional :size
  optional :form_text

  def vue_attributes
    (options[:attributes] || {}).merge({
      "@change": change_event,
      ref: vue_ref,
      'init-value': determine_init_value,
      'v-bind:class': "{ '#{input_error_class}': #{error_key} }",
      'value-type': value_type,
      'class': form_select_class,
      'size': size_class,
      'id': attr_key,
      "#{v_model_type}": input_key,
    })
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

  def determine_init_value
    if init_value
      init_value
    else
      if multiple
        []
      else
        nil
      end
    end
  end

  def placeholder_value
    if multiple
      '[]'
    else
      'null'
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
