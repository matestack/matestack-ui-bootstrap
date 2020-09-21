require 'rails_helper'

describe 'Bootstrap::Components::Button', type: :feature, js: true  do
  include Utils

<<<<<<< HEAD
  it 'renders a default button' do
    matestack_render {btn}
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[type=button]')
  end

  it 'renders a default button with text' do
    matestack_render {btn text: "Button Text"}
    visit example_path
    expect(page).to have_content('Button Text')
    expect(page).to have_selector('button.btn.btn-primary[type=button]')
  end

  it 'renders custom button sizes' do
    matestack_render {btn size: :md}
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary.btn-md[type=button]')
  end

  it 'renders custom button varient' do
    matestack_render {btn variant: :warning}
    visit example_path
    expect(page).to have_selector('button.btn.btn-warning[type=button]')
=======
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
>>>>>>> 4563431faffa3d12c728ca79edeccff39e321676
  end

end