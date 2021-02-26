require 'rails_helper'

describe 'Bootstrap::Components::Close', type: :feature, js: true do
  include Utils

  it 'renders modal close button' do
    matestack_render do
      bs_close dismiss: "modal"
    end
    visit example_path
    expect(page).to have_selector('button.btn-close[type=button]')
    expect(page).to have_selector('button.btn-close[data-bs-dismiss=modal]')
  end

  it 'is possible to add custom classes' do
    matestack_render { bs_close class: 'foobar' }
    visit example_path
    expect(page).to have_selector('button.btn-close.foobar[type=button]')
  end
end
