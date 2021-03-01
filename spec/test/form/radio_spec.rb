require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Input", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_radio_spec" do
        post '/radio_success_form_test', to: 'form_test#success_submit', as: 'radio_success_form_test'
        post '/radio_failure_form_test', to: 'form_test#failure_submit', as: 'radio_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  it 'renders bootstrap radio buttons with options as Array' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > input.form-check-input#foo_1[type="radio"]')
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > label.form-check-label[for="foo_1"]')
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > input.form-check-input#foo_2[type="radio"]')
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > label.form-check-label[for="foo_2"]')

    find('#foo_1').click
    click_button "Submit"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 1 }))
  end

  it 'renders bootstrap radio buttons with options as Hash' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: { "Option 1": 1, "Option 2": 2 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > input.form-check-input#foo_1[type="radio"][value="1"]')
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > label.form-check-label[for="foo_1"]', text: "Option 1")
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > input.form-check-input#foo_2[type="radio"][value="2"]')
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-radio > .form-check > label.form-check-label[for="foo_2"]', text: "Option 2")

    find('#foo_1').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 1 }))

    click_button "Submit"

  end

  it 'renders bootstrap radio buttons with options as Array, clicking multiple options but still sends a single value (was an error once)' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    find('#foo_1').click
    find('#foo_2').click
    find('#foo_1').click
    find('#foo_2').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 2 }))

    click_button "Submit"
  end

  it 'renders bootstrap radio buttons with options as Hash, clicking multiple options but still sends a single value (was an error once)' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: { "Option 1": 1, "Option 2": 2 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    find('#foo_1').click
    find('#foo_2').click
    find('#foo_1').click
    find('#foo_2').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 2 }))

    click_button "Submit"
  end

  it 'renders bootstrap radio buttons with server errors (e.g. required and not clicked)' do
    form_config = get_form_config(path: radio_failure_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  it 'renders bootstrap radio buttons with options as Array with init value' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2], init: 1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 1 }))

    click_button "Submit"
  end

  it 'renders bootstrap radio buttons with additional custom class' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2], class: "some-class"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input") and contains(@class, "some-class")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input") and contains(@class, "some-class")]')
  end

  it 'renders bootstrap radio buttons with label' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2], label: "Some label"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@class="form-label" and contains(text(), "Some label")]')
  end

  it 'renders bootstrap radio buttons with form text' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2], form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@id="form_text_for_foo" and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

  it 'renders bootstrap radio buttons as inline variant' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2], variant: :inline
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[contains(@class, "form-check-inline")]')
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')
  end

  it 'renders disabled radio buttons' do
    form_config = get_form_config(path: radio_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_radio key: :foo, options: [1, 2], disabled: true
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    have_xpath('//form//input[@id="foo_1" and @disabled="disabled" and contains(@class, "is-invalid")]')
    have_xpath('//form//input[@id="foo_2" and @disabled="disabled" and contains(@class, "is-invalid")]')
  end

end
