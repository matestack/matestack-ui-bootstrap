require 'rails_helper'

RSpec.describe "Bootstrap::Components::Toasts", type: :feature, js: true do
  include Utils
  
  it 'modal is not shown on initial page load' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop', static: true, m_title: "Modal Title", text: "Modal Messages", close_btn_text: "Close"
    end
    visit example_path
    expect(page).to have_content 'Launch Modal'
    expect(page).not_to have_content 'Modal Title'
    expect(page).not_to have_content 'Modal Messages'
    expect(page).not_to have_content 'Close'
  end
  
  it 'reveals modal when click button' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop', static: true, m_title: "Modal Title", text: "Modal Messages", close_btn_text: "Close"
    end
    visit example_path
    expect(page).not_to have_content 'Modal Messages'
    
    click_button "Launch Modal"
    expect(page).to have_content 'Modal Messages'
  end
end