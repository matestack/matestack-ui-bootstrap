require 'rails_helper'

describe 'Bootstrap::Components::Button', type: :feature, js: true  do
  include Utils

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
  end

end