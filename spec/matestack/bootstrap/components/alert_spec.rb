require 'rails_helper'

describe 'Bootstrap::Components::Alert', type: :feature, js: true do
  include Utils

  it 'should create a simple primary alert without any content' do
    matestack_render { alert }
    # check for correct default values and classes
  end

  it 'can get a title with various sizes and some content' do
    matestack_render { alert title: 'An alert', text: 'An alert message' }
    visit example_path
    # check for correct title and content
    
    matestack_render { alert title: 'An alert', title_size: 2, text: 'An alert message' }
    visit example_path
    # check for correct title size
  end

  it 'is possible to change the appearance' do
    matestack_render { alert variant: :secondary }
    div class: 'alert alert-secondary'
  end

  it 'can be dismissible' do
    matestack_render { alert dismissible: true }
  end

  it 'gets correct classes for animation' do
    matestack_render { alert animate: true }
  end

  it 'can receive custom css classes' do
    matestack_render { alert class: 'custom classes'}
  end
  
  it 'can be closed per event' do
    matestack_render { alert show_on: 'custom classes'}
    
  end
  
  it 'can be disposed per event' do
    matestack_render { alert dispose_on: 'custom classes'}
  end

end