class Matestack::Ui::Bootstrap::Form::Radio < Matestack::Ui::VueJs::Components::Form::Radio

  include Matestack::Ui::Bootstrap::Registry

  vue_name "matestack-ui-core-form-radio"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-radio" do
      label input_label, class: "form-label" if input_label

      radio_options.to_a.each_with_index do |item, index|
        div class: "form-check #{'form-check-inline' if context.variant == :inline}" do
          input options.merge(radio_attributes(item)).merge(bootstrap_radio_attributes)
          label item_label(item), class: "form-check-label", for: item_id(item_value(item))
          if index == radio_options.to_a.size - 1
            render_errors
          end
        end
      end
      render_form_text if context.form_text
    end

  end

  private

  def bootstrap_radio_attributes
    classes = 'form-check-input'
    {
      class: (options[:class] || "") << classes,
      disabled: context.disabled
    }
  end

  def render_form_text
    div id: "form_text_for_#{attribute_key}", class: "form-text" do
      plain context.form_text
    end
  end

  def render_errors
    if display_errors?
      div class: 'invalid-feedback', 'v-for': "error in #{error_key}", style: "display: block;" do
        plain '{{ error }}'
      end
    end
  end

  def input_error_class
    'is-invalid'
  end

end
