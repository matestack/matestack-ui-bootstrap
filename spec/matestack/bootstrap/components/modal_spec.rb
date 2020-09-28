require 'rails_helper'

RSpec.describe "Bootstrap::Components::Toasts", type: :feature, js: true do
  include Utils
  
  it 'modal is not shown on initial page load' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop', static: true, header: "Modal Title", body: "Modal Messages", footer: "Close"
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
      modal id: 'staticBackdrop', static: true, header: "Modal Title", body: "Modal Messages", footer: "Close"
    end
    visit example_path
    expect(page).not_to have_content 'Modal Messages'
    click_button "Launch Modal"
    sleep 1
    expect(page).to have_content 'Modal Title'
    expect(page).to have_content 'Modal Messages'
    expect(page).to have_content 'Close'  
    expect(page).to have_selector('div#staticBackdrop.modal.fade.show[data-backdrop="static"]')
  end

  it 'is centered and scrollable with size lg' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop', header: "Modal Title", body: "Modal Messages", footer: "Close",
            centered: true, scrollable: true, size: :lg
    end
    visit example_path
    click_button "Launch Modal"
    sleep 1
    expect(page).to have_selector('div.modal-dialog.modal-dialog-centered.modal-dialog-scrollable.modal-lg')
  end
  
  it 'is fullscreen with breakpoints' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      btn text: "Launch Modal MD", data: { toggle: 'modal', target: '#staticBackdropMd' }
      modal id: 'staticBackdrop', fullscreen: true, body: "Modal Messages", footer: "Close"
      modal id: 'staticBackdropMd', fullscreen: :md, body: "Modal Messages", footer: "Close"
    end
    visit example_path
    expect(page).not_to have_content 'Modal Messages'
    click_button "Launch Modal"
    sleep 1
    expect(page).to have_content 'Modal Messages'
    expect(page).to have_selector('div.modal-dialog.modal-fullscreen')
    click_button "Close"
    sleep 1
    click_button "Launch Modal MD"
    sleep 1
    expect(page).to have_content 'Modal Messages'
    expect(page).to have_selector('div.modal-dialog.modal-fullscreen-md-down')
  end

  it 'has custom header and footer using slots' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop', body: "Modal Messages", 
            slots: { 
              header: slot {
                  heading size: 1, text: "Title Header", class: "modal-title"
              }, 
              footer: slot {
                  paragraph class: "text-center", text: "2 days ago"
                  btn text: "OK"
              } }
    end
    visit example_path
    expect(page).not_to have_content 'Title Header'
    click_button "Launch Modal"
    sleep 2
    expect(page).to have_content 'Title Header'
    expect(page).to have_selector('h1.modal-title')
    expect(page).to have_selector('div.modal-header')
    expect(page).to have_selector('div.modal-footer > button.btn.btn-primary')
    expect(page).to have_content '2 days ago'
  end
  
  it 'has custom header and footer classes' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop', header: { text: "Title Header", class: "text-primary" },
      footer: { text: "OK", class: "btn-primary" }
    end
    visit example_path
    expect(page).not_to have_content 'Title Header'
    click_button "Launch Modal"
    sleep 2
    expect(page).to have_content 'Title Header'
    expect(page).to have_selector('div.modal-header > h5.modal-title.text-primary')
    expect(page).to have_selector('div.modal-footer > button.btn.btn-primary')
  end

  it 'has custom body content' do
    matestack_render do
      btn text: "Launch Modal", data: { toggle: 'modal', target: '#staticBackdrop' }
      modal id: 'staticBackdrop' do
        heading size: 2, text: "Custom Body Text"
        close dismiss: "modal"
      end
    end
    visit example_path
    expect(page).not_to have_content 'Custom Body Text'
    click_button "Launch Modal"
    sleep 2
    expect(page).to have_content 'Custom Body Text'
    expect(page).to have_selector('button.close[data-dismiss=modal]')
  end

  it 'can be toggled via event'
  it 'can be shown via event'
  it 'can be hiden via event'
  it 'can be disposed via event'
  
end