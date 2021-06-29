require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Nested Form Support Spec", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "nested_form_support_spec" do
        post '/input_success_form_test', to: 'form_test#success_submit', as: 'nested_form_support_spec_input_success_form_test'
        post '/input_failure_form_test', to: 'form_test#failure_submit', as: 'nested_form_support_spec_input_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  it 'properly renders all input components with dynamically adjusted IDs' do
    form_config = get_form_config(path: nested_form_support_spec_input_success_form_test_path)

    ExamplePage.define_method(:order_item_form) do |order_item = OrderItem.new|
      form_fields_for order_item, key: :order_items_attributes do

        bs_form_input key: :a, type: :number, label: "Label A"
        bs_form_select key: :b, options: [1, 2], label: "Label B"
        bs_form_switch key: :c, options: [1, 2], label: "Label C"
        bs_form_switch key: :d, label: "Label D"
        bs_form_radio key: :e, options: [1, 2], label: "Label E"
        bs_form_textarea key: :f, type: :number, label: "Label F"
        bs_form_checkbox key: :g, label: "Label G"
        bs_form_checkbox key: :h, options: [1, 2], label: "Label H"

        form_fields_for_remove_item do
          bs_btn type: :button, variant: :danger do
            bs_icon name: "trash"
          end
        end
      end
    end

    matestack_render do
      matestack_form form_config do

        form_fields_for_add_item key: :order_items_attributes, prototype: method(:order_item_form) do
          bs_btn "add", type: :button, variant: :primary, outline: true, class: "mt-2"
        end

        bs_form_submit text: "Submit"
      end
    end

    visit example_path

    click_on "add"
    click_on "add"

    [0, 1].each do |i|
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-input > label[for=\"a_order_items_attributes_child_#{i}\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-input > input.form-control#a_order_items_attributes_child_#{i}")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-select > label[for=\"b_order_items_attributes_child_#{i}\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-select > select.form-select#b_order_items_attributes_child_#{i}")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-switch > label[for=\"c_order_items_attributes_child_#{i}\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-switch > div.form-switch > input.form-check-input#c_order_items_attributes_child_#{i}_1")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-switch > div.form-switch > input.form-check-input#c_order_items_attributes_child_#{i}_2")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-switch > div.form-switch > input.form-check-input#d_order_items_attributes_child_#{i}_1")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-switch > div.form-switch > label[for=\"d_order_items_attributes_child_#{i}_1\"]")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-radio > label[for=\"e_order_items_attributes_child_#{i}\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-radio > div.form-check > input.form-check-input#e_order_items_attributes_child_#{i}_1")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-radio > div.form-check > label[for=\"e_order_items_attributes_child_#{i}_1\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-radio > div.form-check > input.form-check-input#e_order_items_attributes_child_#{i}_2")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-radio > div.form-check > label[for=\"e_order_items_attributes_child_#{i}_2\"]")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-textarea > label[for=\"f_order_items_attributes_child_#{i}\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-textarea > textarea.form-control#f_order_items_attributes_child_#{i}")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-checkbox > div.form-check > input.form-check-input#g_order_items_attributes_child_#{i}_1")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-checkbox > div.form-check > label[for=\"g_order_items_attributes_child_#{i}_1\"]")

      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-checkbox > label[for=\"h_order_items_attributes_child_#{i}\"]")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-checkbox > div.form-check > input.form-check-input#h_order_items_attributes_child_#{i}_1")
      expect(page).to have_selector("form > div > div.matestack-form-fields-for#order_items_attributes_child_#{i} > div.matestack-ui-bootstrap-form-checkbox > div.form-check > input.form-check-input#h_order_items_attributes_child_#{i}_2")
    end

  end



end
