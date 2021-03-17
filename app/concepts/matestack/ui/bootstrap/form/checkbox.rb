class Matestack::Ui::Bootstrap::Form::Checkbox < Matestack::Ui::VueJs::Components::Form::Checkbox

  vue_name "matestack-ui-core-form-checkbox"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-form-checkbox" do
      label class: "form-label", text: input_label, for: attr_key if input_label && multiple?
      render_options
      render_errors
      render_form_text unless context.form_text.nil? # otherwise renders empty div
    end
  end

  private

  def multiple?
   checkbox_options.present?
  end

  def render_options
    # multiple
    if multiple?
     checkbox_options.to_a.each do |item|
        checkbox_wrapper do
          input options.merge(checkbox_attributes(item)).merge(class: 'form-check-input'))
          bootstrap_label text: item_name(item), for_input: item_id(item)
        end
      end
    # checked/unchecked checkbox (true/false checkbox)
    else
      checkbox_wrapper do
        input true_false_checkbox_attributes.merge(type: :hidden, id: nil, value: 0)
        input true_false_checkbox_attributes.merge(type: :checkbox, id: item_id(1), class: 'form-check-input')

        bootstrap_label text: input_label, for_input: item_id(1)
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

  # def id_for_item(value)
  #   "#{options[:id]}_#{value}_#{attr_key}"
  # end

end
