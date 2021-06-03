class Matestack::Ui::Bootstrap::Form::Textarea < Matestack::Ui::VueJs::Components::Form::Textarea

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-textarea"

  optional :form_text
  optional :disabled
  optional :placeholder
  optional :rows
  optional :cols

  def response
    div class: "matestack-ui-bootstrap-textarea" do
      label input_label, for: attribute_key,  class: "form-label" if input_label
      textarea options.merge(textarea_attributes).merge(bootstrap_textarea_attributes)
      render_errors
      render_form_text if context.form_text
    end
  end

  def bootstrap_textarea_attributes
    {
      id: (options[:id] || attribute_key),
      class: (options[:class] || "") << (" form-control"),
      rows: context.rows,
      cols: context.cols,
      disabled: context.disabled
    }
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
