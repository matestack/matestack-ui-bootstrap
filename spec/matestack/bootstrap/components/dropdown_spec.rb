require 'rails_helper'

describe 'Bootstrap::Components::ListGroup', type: :feature, js: true do
  include Utils
  
  it 'renders basic dropdown' do
    matestack_render do 
      list_group 
    end
    visit example_path
    expect(page).to have_selector('ul.list-group')
  end

end