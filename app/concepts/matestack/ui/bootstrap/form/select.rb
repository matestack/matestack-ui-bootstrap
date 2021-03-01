class Matestack::Ui::Bootstrap::Form::Select < Matestack::Ui::Core::Form::Select::Base

  vue_js_component_name "matestack-ui-core-form-select"

  optional :variant
  optional :size
  optional :form_text

  # %select{ html_attributes.merge(vue_attributes) }
  #   - if placeholder
  #     %option{value: placeholder_value, disabled: true, selected: init_value.nil?}= placeholder
  #   - select_options.to_a.each do |item|
  #     %option{value: item_value(item), disabled: item_disabled(item)}= item_label(item)
  # = render_errors
  # - if form_text
  #   = render_form_text

  def response
    div class: "matestack-ui-bootstrap-form-select" do
      label for: attr_key,  class: "form-label", text: input_label if input_label
      # id is missing!
      select select_attributes.merge({ class: form_select_class, size: size_class }) do
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

  # def determine_init_value
  #   if init_value
  #     init_value
  #   else
  #     if multiple
  #       []
  #     else
  #       nil
  #     end
  #   end
  # end
  #
  # def placeholder_value
  #   if multiple
  #     '[]'
  #   else
  #     'null'
  #   end
  # end

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
