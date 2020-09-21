require 'rails_helper'

describe 'Bootstrap::Components::Alert', type: :feature, js: true do
  include Utils

  it 'should create a simple primary alert without any content' do
    matestack_render { alert }
    # check for correct default values and classes
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary[role=alert]')
  end

  it 'can get a title with various sizes and some content' do
    matestack_render { alert title: 'An alert', text: 'An alert message' }
    visit example_path
    # check for correct title and content
    expect(page).to have_content('An alert')
    expect(page).to have_content('An alert message')

    matestack_render { alert title: 'An alert', title_size: 2, text: 'An alert message' }
    visit example_path
    # check for correct title size
    expect(page).to have_selector('h2.alert-heading')
  end

  it 'is possible to change the appearance' do
    matestack_render { alert variant: :secondary }
    visit example_path
    expect(page).to have_selector('div.alert.alert-secondary[role=alert]')
  end

  it 'can be dismissible' do
    matestack_render { alert dismissible: true }
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.alert-dismissible[role=alert]')
  end

  it 'gets correct classes for animation' do
    matestack_render { alert animate: true }
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.alert-dismissible.fade.show[role=alert]')
  end

  it 'can receive custom css classes' do
    matestack_render { alert class: 'custom classes'}
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.custom.classes[role=alert]')
  end
  
  it 'can be closed per event' do
    matestack_render { alert close_on: 'closeAlert' }
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.custom.classes[role=alert]')
  end
  
  it 'can be disposed per event' do
    matestack_render { alert dispose_on: 'disposeAlert'}
    visit example_path
    expect(page).to have_selector('div.alert.alert-primary.custom.classes[role=alert]')
  end

end