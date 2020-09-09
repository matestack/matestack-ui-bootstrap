require 'rails_helper'

describe 'Components::Col', type: :feature, js: true do
  include Utils

  it 'renders default column' do
    matestack_render do
      close dismiss: "modal"
    end
    visit example_path
    expect(page).to have_selector('button.close[type=button]')
  end
end