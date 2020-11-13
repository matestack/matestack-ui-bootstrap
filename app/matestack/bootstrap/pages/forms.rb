class Bootstrap::Pages::Forms < Matestack::Ui::Page

  def response
    container do
      row horizontal: :center do
        col do
          form_partial

        end
      end
    end
  end

  def form_partial
    form form_config do

      div class: "mb-3 input-group" do
        span class: "input-group-text", text: "@"
        bootstrap_input key: :some_input_1, type: :text, class: "some-class"
      end

      div class: "mb-3" do
        bootstrap_input key: :some_input_2, label: "Text Input", type: :text
      end

      div class: "mb-3" do
        bootstrap_select key: :some_select_input, options: [:test, :test1, :test2], class: "some-class", placeholder: "Choose!", label: "Select Single"
      end

      div class: "mb-3" do
        bootstrap_select form_text: "just some notes", key: :some_select_input, options: [:test, :test1, :test2], variant: :sm, class: "some-class", placeholder: "Choose!", label: "Select Single XL"
      end

      div class: "mb-3" do
        bootstrap_select multiple: true, key: :some_multi_select_input, options: [:test, :test1, :test2], class: "some-class", placeholder: "Choose!", label: "Select Multiple"
      end

      div class: "mb-3" do
        bootstrap_checkbox key: :some_single_checkbox_input, label: "Test"
      end

      div class: "mb-3" do
        bootstrap_checkbox form_text: "just some notes", label: "Multi Checkbox", key: :some_multi_checkbox_input_1, options: [0, 1]
      end

      div class: "mb-3" do
        bootstrap_checkbox variant: :inline, key: :some_multi_checkbox_input_2, disabled: true, options: { 'Active': 1, 'Inactive': 0 }
      end

      div class: "mb-3" do
        bootstrap_radio key: :some_radio_input_1, disabled: true, options: [0, 1]
      end

      div class: "mb-3" do
        bootstrap_radio key: :some_radio_input_2, label: "Radio 2", form_text: "just some notes", options: { 'Active': 1, 'Inactive': 0 }
      end

      div class: "mb-3" do
        bootstrap_switch form_text: "just some notes", label: "Single Switch", key: :some_switch_input_1
      end

      div class: "mb-3" do
        bootstrap_switch disabled: true, form_text: "just some notes", label: "Multi Switch 1", key: :some_multi_switch_input_1, options: [0, 1]
      end

      div class: "mb-3" do
        bootstrap_switch form_text: "just some notes", label: "Multi Switch 2", key: :some_multi_switch_input_2, options: { 'Active': 1, 'Inactive': 0 }
      end

      div class: "mb-3" do
        bootstrap_input variant: :lg, form_text: "just some notes", key: :some_single_file_input, type: :file
      end

      div class: "mb-3" do
        bootstrap_input form_text: "just some notes", placeholder: "Select a file", browse_button_text: "Click", key: :some_multi_file_input, type: :file, multiple: true
      end

      div class: "mb-3" do
        bootstrap_input form_text: "just some notes", key: :some_range_input, type: :range, step: 2, max: 10, show_value: true
      end

      div class: "mb-3" do
        bootstrap_submit button_variant: :primary, spinner_variant: :light, text: "Submit!!"
      end

      div class: "mb-3" do
        toast header: { title: "Success", subtitle: "Form submission" },
              body: "Submitted successfully", show_on: :success, hide_on: :failure, autohide: false
        toast header: { title: "Failure", subtitle: "Form submission" },
              body: "Something went wrong", show_on: :failure, hide_on: :success, autohide: false
      end
    end

  end

  private

  def form_config
    {
      for: :wrapper,
      path: form_test_path,
      method: :post,
      success: {
        emit: :success
      },
      failure: {
        emit: :failure
      },
      class: 'm-5 py-5'
    }
  end

end
