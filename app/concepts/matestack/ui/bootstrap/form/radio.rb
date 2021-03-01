class Matestack::Ui::Bootstrap::Form::Radio < Matestack::Ui::Core::Form::Radio::Base

  vue_js_component_name "matestack-ui-core-form-radio"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-radio" do
      label class: "form-label", text: input_label if input_label

      radio_options.to_a.each_with_index do |item, index|
        div class: "form-check #{'form-check-inline' if variant == :inline}" do
          input html_attributes.merge(
            attributes: vue_attributes,
            type: :radio,
            id: "#{id_for_item(item_value(item))}",
            name: item_name(item),
            value: item_value(item),
            class: radio_class,
            disabled: disabled
          )
          label class: "form-check-label", text: item_label(item), for: id_for_item(item_value(item))
          if index == radio_options.to_a.size - 1
            render_errors
          end
        end
      end
      render_form_text if form_text
    end

  end

  def radio_class
    (options[:class] || "") << (" form-check-input")
  end

  def render_form_text
    div id: "form_text_for_#{attr_key}", class: "form-text" do
      plain form_text
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

end
