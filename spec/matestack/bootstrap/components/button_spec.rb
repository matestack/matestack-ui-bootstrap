require 'rails_helper'

describe 'Bootstrap::Components::Button', type: :feature, js: true  do
  include Utils

  it 'renders primary button as default' do
    matestack_render do
      btn size: :md
    end
    visit '/example'
    expect(page).to have_selector('button.btn.btn-primary[type=button]')
  end

  it 'can have a different type' do
    matestack_render { button type: 'submit' }
    pending 
    fail
  end

  it 'is possible to change appearance with variant' do
    matestack_render { button variant: :secondary }
    pending
    fail
  end

  it 'is possible to create outlined warning button' do
    matestack_render { button variant: :warning, outline: true }
    pending
    fail
  end

  it 'can have different size' do
    matestack_render { button size: :lg }
    pending
    fail
  end

end