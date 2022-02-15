class Matestack::Ui::Bootstrap::Form::Select < Matestack::Ui::VueJs::Components::Form::Select

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-select"

  optional :variant
  optional :size
  optional :form_text

  def response
    div class: "matestack-ui-bootstrap-form-select" do
      label input_label, ":for": id,  class: "form-label" if input_label
      select select_attributes.merge(bootstrap_select_attributes) do
        render_options
      end
      render_errors
      render_form_text
    end
  end

  def bootstrap_select_attributes
    {
      class: form_select_class,
      size: size_class,
      disabled: context.disabled
    }
  end

  def form_select_class
    case context.variant
    when :lg
      (options[:class] || "") << (" form-select form-select-lg")
    when :sm
      (options[:class] || "") << (" form-select form-select-sm")
    else
      (options[:class] || "") << (" form-select")
    end
  end

  def size_class
    context.size
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
    div class: "form-text form-text-for-#{attribute_key}" do
      plain context.form_text
    end
  end

end
