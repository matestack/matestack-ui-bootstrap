require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Input", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_checkbox_spec" do
        post '/checkbox_success_form_test', to: 'form_test#success_submit', as: 'checkbox_success_form_test'
        post '/checkbox_failure_form_test', to: 'form_test#failure_submit', as: 'checkbox_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  it 'renders single bootstrap checkbox button, simply submitting sends :nil' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input_1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="__some_checkbox_input_1" and contains(@class, "form-check-input")]')

    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { "some_checkbox_input_1"=>nil }))
  end

  it 'renders single bootstrap checkbox button, clicking button and submitting sends :true' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input_1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="__some_checkbox_input_1" and contains(@class, "form-check-input")]')

    find('#__some_checkbox_input_1').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { "some_checkbox_input_1"=>true }))

  end

  it 'renders single bootstrap checkbox button, clicking it twice submits :false again it' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input_1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="__some_checkbox_input_1" and contains(@class, "form-check-input")]')

    find('#__some_checkbox_input_1').click
    find('#__some_checkbox_input_1').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { "some_checkbox_input_1"=>false }))
  end

  it 'renders bootstrap checkbox button with options as Array' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="_1_foo" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="_2_foo" and contains(@class, "form-check-input")]')

    find('#_1_foo').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: [1] }))

  end

  it 'renders bootstrap checkbox button with options as Hash' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: { "Option 1": 1, "Option 2": 2 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="_1_foo" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="_2_foo" and contains(@class, "form-check-input")]')

    find('#_1_foo').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: ['1'] }))

  end

  it 'renders bootstrap checkbox button with options as Array, clicking multiple options' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="_1_foo" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="_2_foo" and contains(@class, "form-check-input")]')

    find('#_1_foo').click
    find('#_2_foo').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: [1,2] }))

  end

  it 'renders bootstrap checkbox button with options as Hash, clicking multiple options' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: { "Option 1": 1, "Option 2": 2 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="_1_foo" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="_2_foo" and contains(@class, "form-check-input")]')

    find('#_1_foo').click
    find('#_2_foo').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: ['1','2'] }))

  end

  it 'renders bootstrap checkbox button with server errors' do
    form_config = get_form_config(path: checkbox_failure_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//input[@id="_2_foo" and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  it 'renders bootstrap checkbox button with additional custom class' do
# add additional custom class to bootstrap checkbox

#     form_config = get_form_config(path: checkbox_success_form_test_path)
#     matestack_render do
#       form form_config do
#         bs_form_checkbox key: :foo, options: [1, 2], class: "some-class"
#         bs_form_submit text: "Submit"
#       end
#     end
#     visit example_path
#     expect(page).to have_xpath('//form//checkbox[@id="foo" and contains(@class, "form-checkbox") and contains(@class, "some-class")]')
  end

  it 'renders disabled bootstrap checkbox buttons' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], disabled: true
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    have_xpath('//form//input[@id="_1_foo" and @disabled="disabled" and contains(@class, "is-invalid")]')
    have_xpath('//form//input[@id="_2_foo" and @disabled="disabled" and contains(@class, "is-invalid")]')
  end

  it 'renders bootstrap checkbox button with label' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], label: "Some label"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@for="foo" and @class="form-label" and contains(text(), "Some label")]')
  end

  it 'renders bootstrap checkbox button with form text' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@id="form_text_for_foo" and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

  it 'renders bootstrap checkbox button as inline variant' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], variant: :inline
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[contains(@class, "form-check-inline")]')
    expect(page).to have_xpath('//form//input[@id="_1_foo" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="_2_foo" and contains(@class, "form-check-input")]')
  end

end
