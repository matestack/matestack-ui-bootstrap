require 'rails_helper'

describe 'Bootstrap::Components::Button', type: :feature, js: true  do
  include Utils

  it 'renders a default button' do
    matestack_render { bs_btn }
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[type=button]')
  end

  it 'renders a default button with text' do
    matestack_render { bs_btn text: "Button Text" }
    visit example_path
    expect(page).to have_content('Button Text')
    expect(page).to have_selector('button.btn.btn-primary[type=button]')
  end

  it 'can have a different type' do
    matestack_render { bs_btn type: 'submit' }
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[type=submit]')
  end

  it 'renders custom button sizes' do
    matestack_render { bs_btn size: :md }
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary.btn-md[type=button]')
  end

  it 'renders custom button variant' do
    matestack_render { bs_btn variant: :warning }
    visit example_path
    expect(page).to have_selector('button.btn.btn-warning[type=button]')
  end

  it 'renders custom button outline variant' do
    matestack_render { bs_btn variant: :warning, outline: true }
    visit example_path
    expect(page).to have_selector('button.btn.btn-outline-warning[type=button]')
  end

  it 'renders links, transitions, actions or onclick components visualized as btns' do
    pending "need to test for correct core component behavior"
    fail
    
    matestack_render do
      bs_btn action: { path: root_path, method: :post } do
        plain "Action"
      end
      bs_btn transition: { path: root_path } do
        plain "Transition"
      end
      bs_btn link: { path: root_path } do
        plain "Link"
      end
      bs_btn onclick: { emit: "test" } do
        plain "Onclick"
      end
    end
    visit example_path
    expect(page).to have_selector('a.btn[role=button]', text: "Action")
    expect(page).to have_selector('a.btn[role=button]', text: "Transition")
    expect(page).to have_selector('a.btn[role=button]', text: "Link")
    expect(page).to have_selector('div.btn[role=button]', text: "Onclick") #core onclick renders a div --> will be changed soon
  end

end
