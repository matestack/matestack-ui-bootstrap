require 'rails_helper'

describe 'Bootstrap::Components::Button', type: :feature, js: true  do
  include Utils

  it 'renders default button' do
    matestack_render do
      btn size: :md
    end
    visit '/example'
    expect(page).to have_selector('button.btn.btn-primary[type=button]')
  end

end