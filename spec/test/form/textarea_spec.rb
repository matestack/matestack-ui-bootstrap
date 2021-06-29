require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Textarea", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_text_input_spec" do
        post '/textarea_success_form_test', to: 'form_test#success_submit', as: 'textarea_success_form_test'
        post '/textarea_failure_form_test', to: 'form_test#failure_submit', as: 'textarea_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  it 'renders basic bootstrap textarea field' do
    form_config = get_form_config(path: textarea_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo, type: :text
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-textarea > textarea.form-control#foo')

    fill_in "foo", with: "bar"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: "bar" }))

    click_button "Submit"
  end

  it 'renders basic bootstrap textarea field with server errors' do
    form_config = get_form_config(path: textarea_failure_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo, type: :text
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//textarea[@id="foo" and contains(@class, "form-control") and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  it 'renders basic bootstrap textarea field with additional custom class' do
    form_config = get_form_config(path: textarea_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo, type: :text, class: "some-class"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//textarea[@id="foo" and contains(@class, "form-control") and contains(@class, "some-class")]')
  end

  it 'renders basic bootstrap textarea field with label' do
    form_config = get_form_config(path: textarea_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo, type: :text, label: "Some label"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@for="foo" and @class="form-label" and contains(text(), "Some label")]')
  end

  it 'renders basic bootstrap textarea field with placeholder' do
    form_config = get_form_config(path: textarea_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo, type: :text, placeholder: "fill!"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//textarea[@id="foo" and @placeholder="fill!" and contains(@class, "form-control")]')
  end

  it 'renders basic bootstrap textarea field with form text' do
    form_config = get_form_config(path: textarea_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo, type: :text, form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[contains(@class, "form-text-for-foo") and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

  it 'renders basic bootstrap textarea field with form rows and cols' do
    form_config = get_form_config(path: textarea_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_textarea key: :foo1, id: :foo1, type: :text, rows: 3, cols: 10
        bs_form_textarea key: :foo2, id: :foo2, type: :text, rows: 10, cols: 30
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page.find('textarea#foo1')['rows']).to eq '3'
    expect(page.find('textarea#foo1')['cols']).to eq '10'
    expect(page.find('textarea#foo2')['rows']).to eq '10'
    expect(page.find('textarea#foo2')['cols']).to eq '30'
  end



end
