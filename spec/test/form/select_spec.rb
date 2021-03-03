require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Input", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_select_spec" do
        post '/select_success_form_test', to: 'form_test#success_submit', as: 'select_success_form_test'
        post '/select_failure_form_test', to: 'form_test#failure_submit', as: 'select_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  it 'renders bootstrap select field with options as Array' do
    form_config = get_form_config(path: select_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: [1, 2, 3]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@class="matestack-ui-bootstrap-form-select"]//select[@id="foo" and contains(@class, "form-select")]')

    select "2", from: "foo"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 2 }))

    click_button "Submit"
  end

  it 'renders bootstrap select field with options as Hash' do
    form_config = get_form_config(path: select_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: { "Option 1": 1, "Option 2": 2, "Option 3": 3 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@class="matestack-ui-bootstrap-form-select"]//select[@id="foo" and contains(@class, "form-select")]')

    select "Option 2", from: "foo"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 2 }))

    click_button "Submit"
  end

  it 'renders bootstrap select field with server errors' do
    form_config = get_form_config(path: select_failure_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: [1, 2, 3]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//div[@class="matestack-ui-bootstrap-form-select"]//select[@id="foo" and contains(@class, "form-select") and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  it 'renders bootstrap select field with additional custom class' do
    form_config = get_form_config(path: select_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: [1, 2, 3], class: "some-class"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@class="matestack-ui-bootstrap-form-select"]//select[@id="foo" and contains(@class, "form-select") and contains(@class, "some-class")]')
  end

  it 'renders bootstrap select field with label' do
    form_config = get_form_config(path: select_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: [1, 2, 3], label: "Some label"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@for="foo" and @class="form-label" and contains(text(), "Some label")]')
  end

  it 'renders bootstrap select field with disabled placeholder option' do
    form_config = get_form_config(path: select_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: [1, 2, 3], placeholder: "select!"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@class="matestack-ui-bootstrap-form-select"]//select[@id="foo" and contains(@class, "form-select")]//option[@disabled="disabled" and contains(text(), "select!")]')
  end

  it 'renders basic bootstrap input field with form text' do
    form_config = get_form_config(path: select_success_form_test_path)
    matestack_render do
      form form_config do
        bs_form_select key: :foo, options: [1, 2, 3], form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@id="form_text_for_foo" and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

end
