require 'rails_helper'

describe 'Bootstrap::Components::Alert', type: :feature, js: true do
  include Utils

  it 'should create a simple primary alert without any content' do
    matestack_render { bs_alert }
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary[role=alert]')
  end

  it 'can get a title with various sizes and some content' do
    matestack_render { bs_alert title: 'An alert', text: 'An alert message' }
    visit example_path
    expect(page).to have_content('An alert')
    expect(page).to have_content('An alert message')

    matestack_render { bs_alert title: 'An alert', title_size: 2, text: 'An alert message' }
    visit example_path
    expect(page).to have_selector('h2.alert-heading')
  end

  it 'can render a block for custom content' do
    matestack_render { bs_alert { span class: "foobar", text: "custom content" } }
    visit example_path
    expect(page).to have_selector('.alert > span.foobar', text: "custom content")
  end

  it 'is possible to change the appearance' do
    matestack_render { bs_alert variant: :secondary }
    visit example_path
    expect(page).to have_selector('div.alert.alert-secondary[role=alert]')
  end

  it 'can be dismissible' do
    matestack_render { bs_alert dismissible: true }
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.alert-dismissible[role=alert]')
  end

  it 'gets correct classes for animation' do
    matestack_render { bs_alert text: 'An alert message', animate: true, dismissible: true }
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.fade.show[role=alert]')
  end

  it 'can receive custom css classes' do
    matestack_render { bs_alert class: 'custom classes'}
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.custom.classes[role=alert]')
  end

  it 'can be closed per event' do
    matestack_render {
      bs_alert close_on: 'closeAlert', text: "Close Alert Test"
      onclick emit: "closeAlert" do
        bs_btn text: "Close"
      end
    }
    visit example_path
    expect(page).to have_content('Close Alert Test')
    click_button('Close')
    expect(page).to_not have_content('Close Alert Test')
  end

  it 'can be disposed per event' do
    pending "dispose JS code not working yet"

    matestack_render {
      bs_alert dispose_on: 'disposeAlert', text: "Dispose Alert Test"
      onclick emit: "disposeAlert" do
        bs_btn text: "Dispose"
      end
    }
    visit example_path
    expect(page).to have_content('Dispose Alert Test')
    click_button('Dispose')
    expect(page).to_not have_content('Dispose Alert Test')
  end

end
