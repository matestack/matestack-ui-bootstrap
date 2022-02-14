class Matestack::Ui::Bootstrap::Form::Checkbox < Matestack::Ui::VueJs::Components::Form::Checkbox

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-checkbox"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-form-checkbox" do
      label input_label, class: "form-label", ":for": id if input_label && multiple?
      render_options
      render_errors
      render_form_text unless context.form_text.nil? # otherwise renders empty div
    end
  end

  private

  def bootstrap_attributes
    classes = 'form-check-input'
    classes = [options[:class], classes].join(' ')
    {
      class: classes,
      disabled: context.disabled
    }
  end

  def multiple?
   checkbox_options.present?
  end

  def render_options
    # multiple
    if multiple?
     checkbox_options.to_a.each do |item|
        checkbox_wrapper do
          input options.merge(checkbox_attributes(item)).merge(bootstrap_attributes)
          bootstrap_label text: item_label(item), for_input: item_id(item)
        end
      end
    # checked/unchecked checkbox (true/false checkbox)
    else
      checkbox_wrapper do
        input true_false_checkbox_attributes.merge(type: :hidden, id: nil, value: 0)
        input true_false_checkbox_attributes.merge(type: :checkbox, ":id": item_id(1)).merge(bootstrap_attributes)

        bootstrap_label text: input_label, for_input: item_id(1)
      end
    end
  end

  def checkbox_wrapper(options = {}, &block)
    wrapper_attributes = (options[:attributes] || {}).merge({
      class: "form-check #{'form-check-inline' if context.variant == :inline}"
    })
    div wrapper_attributes do
      yield if block_given?
    end
  end

  def bootstrap_label(text:, for_input:)
    label text, ":for": for_input, class: 'form-check-label'
  end

  def render_errors
    if display_errors?
      div class: 'invalid-feedback', 'v-for': "error in #{error_key}", style: "display: block;" do
        plain '{{ error }}'
      end
    end
  end

  def error_class
    'is-invalid'
  end

  def checkbox_options
    super || {}
  end

  def render_form_text
    div class: "form-text form-text-for-#{attribute_key}" do
      plain context.form_text
    end
  end

  def id
    if ctx.id.present?
      "'#{ctx.id}'"
    else
      if form_context.is_nested_form?
        "'#{key}'+vc.parentNestedFormRuntimeId"
      else
        "'#{key}'"
      end
    end
  end

end
