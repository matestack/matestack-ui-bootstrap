class Matestack::Ui::Bootstrap::Form::Checkbox < Matestack::Ui::Core::Form::Checkbox::Base

  vue_js_component_name "matestack-ui-bootstrap-form-checkbox"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-form-checkbox" do
      label class: "form-label", text: input_label, for: attr_key if input_label && multiple?
      render_options
      render_errors
      render_form_text unless form_text.nil? # otherwise renders empty div
    end
  end

  private

  def multiple?
    options[:options].present?
  end

  def render_options
    # multiple
    if multiple?
      options[:options].to_a.each do |item|
        checkbox_wrapper do
          input html_attributes.merge(
            attributes: vue_attributes,
            type: :checkbox,
            id: "#{id_for_item(item_value(item))}",
            name: item_name(item),
            value: item_value(item),
            class: 'form-check-input'
          )
          bootstrap_label text: item_name(item), for_input: id_for_item(item_value(item))
        end
      end
    # checked/unchecked checkbox (true/false checkbox)
    else
      checkbox_wrapper do
        input html_attributes.merge(
          attributes: vue_attributes_for_single_input,
          type: :hidden,
          value: (false_value || 0),
          class: 'form-check-input'
        )

        input html_attributes.merge(
          attributes: vue_attributes_for_single_input,
          type: :checkbox,
          id: id_for_item(value),
          value: checked_value,
          class: 'form-check-input'
        )

        bootstrap_label text: input_label, for_input: id_for_item(value)
      end
    end
  end

  def checkbox_wrapper(options = {}, &block)
    div class: "form-check #{'form-check-inline' if variant == :inline}", attributes: options[:attributes] do
      yield
    end
  end

  def bootstrap_label(text:, for_input:)
    label text: text, for: for_input, class: 'form-check-label'
  end

  def render_errors
    unless @included_config[:errors] == false && (errors == false || errors.nil?) || errors == false
      div class: 'invalid-feedback', attributes: { 'v-for': "error in #{error_key}", style: "display: block;" } do
        plain '{{ error }}'
      end
    end
  end

  def input_error_class
    'is-invalid'
  end

  def checkbox_options
    super || {}
  end

  def render_form_text
    div id: "form_text_for_#{attr_key}", class: "form-text" do
      plain form_text
    end
  end

  def id_for_item(value)
    "#{html_attributes[:id]}_#{value}_#{attr_key}"
  end

end
