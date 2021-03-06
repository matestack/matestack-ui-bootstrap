class Matestack::Ui::Bootstrap::Form::Switch < Matestack::Ui::Bootstrap::Form::Checkbox

  vue_js_component_name "matestack-ui-core-form-checkbox"

  optional :form_text
  optional :disabled
  optional :variant

  def response
    div class: "matestack-ui-bootstrap-switch" do
      label class: "form-label", text: input_label, for: attr_key if input_label && multiple?
      render_options
      render_errors
      render_form_text unless form_text.nil? # otherwise renders empty div
      # if !checkbox_options.empty?
      #   label for: attr_key,  class: "form-label", text: input_label if input_label
      # end
      # if !checkbox_options.empty?
      #   multiple_switches
      # else
      #   true_false_switch
      # end
      # render_form_text unless form_text.nil? # otherwise renders empty div
    end
  end

  private

  def checkbox_wrapper(options = {}, &block)
    div class: "form-check form-switch #{'form-check-inline' if variant == :inline}", attributes: options[:attributes] do
      yield
    end
  end

  # def bs_label(text:, for_input:)
  #   label text: text, for: for_input, class: 'form-check-label'
  # end
  #
  # def true_false_switch
  #   checkbox_wrapper do
  #     form_input type: :hidden, key: key, value: (false_value || 0), errors: false
  #     input html_attributes.merge(
  #       type: :checkbox,
  #       id: "#{id_for_item(value)}",
  #       # id: "#{key}", alternative to address the visible input field better?
  #       name: item_name(key),
  #       value: checked_value,
  #       class: 'form-check-input',
  #       disabled: disabled,
  #       attributes: vue_attributes.merge(
  #         ref: "input.#{attr_key}",
  #       )
  #     )
  #     bs_label text: input_label, for_input: id_for_item(value)
  #     render_errors
  #   end
  # end
  #
  # def multiple_switches
  #   checkbox_options.to_a.each do |item|
  #     checkbox_wrapper do
  #       input html_attributes.merge(
  #         type: :checkbox,
  #         id: "#{id_for_item(item_value(item))}",
  #         name: item_name(item),
  #         value: item_value(item),
  #         class: 'form-check-input',
  #         disabled: disabled,
  #         attributes: vue_attributes
  #       )
  #       bs_label text: item_name(item), for_input: id_for_item(item_value(item))
  #       render_errors if checkbox_options.to_a.last == item
  #     end
  #   end
  # end
  #
  # def render_errors
  #   unless @included_config[:errors] == false && (errors == false || errors.nil?) || errors == false
  #     div class: 'invalid-feedback', attributes: { 'v-for': "error in #{error_key}" } do
  #       plain '{{ error }}'
  #     end
  #   end
  # end
  #
  # def input_error_class
  #   'is-invalid'
  # end
  #
  # def checkbox_options
  #   super || {}
  # end
  #
  # def render_form_text
  #   div id: "form_text_for_#{attr_key}", class: "form-text" do
  #     plain form_text
  #   end
  # end

end
