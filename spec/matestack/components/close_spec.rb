require 'rails_helper'

describe 'Components::Close', type: :feature, js: true do
  include Utils

  it 'renders modal close button' do
    matestack_render do
      close dismiss: "modal"
    end
    visit example_path
    expect(page).to have_selector('button.close[type=button]')
  end
end