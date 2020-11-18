class Bootstrap::Form::Date <  Matestack::Ui::Core::Component::Dynamic

  include Matestack::Ui::Core::Form::Utils
  include Matestack::Ui::Core::Form::HasInputHtmlAttributes
  include Matestack::Ui::Core::Form::HasErrors

  requires :key
  optional :multiple, :init, for: { as: :input_for }, label: { as: :input_label }

  optional :form_text
  optional :disabled
  optional :placeholder

  optional :with_time

  vue_js_component_name "matestack-ui-bootstrap-date"

  def input_key
    "$parent.data[\"#{key}\"]"
  end

  def error_key
    "$parent.errors[\"#{key}\"]"
  end

  def setup
    @component_config[:init_value] = init_value
    @component_config[:with_time] = with_time
  end

  def response
    div do
      label for: attr_key,  class: "form-label", text: input_label if input_label
      input html_attributes.merge(attributes: vue_attributes).merge(bootstrap_input_attributes)
      render_errors
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
      "aria-describedby": attr_key
    }).merge({ "v-model": input_key })
  end

  def change_event
    "$parent.inputChanged('#{attr_key}');".strip
  end

  def custom_options_validation
    raise "included form config is missing, please add ':include' to parent form component" if @included_config.nil?
  end

  def attr_key
    super
  end

  private

  def parse_value(value)
    if [true, false].include? value
      value ? 1 : 0
    else
      return value
    end
  end

  def bootstrap_input_attributes
    {
      class: (options[:class] || "") << (" form-control flatpickr"),
      disabled: disabled
    }
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
