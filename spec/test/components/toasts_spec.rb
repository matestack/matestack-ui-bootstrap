require 'rails_helper'

RSpec.describe "Bootstrap::Components::Toasts", type: :feature, js: true do
  include Utils

  it 'toast is not shown on initial page load' do
    matestack_render do
      bs_toast header: 'Bootstrap Toast', body: 'I`m a toast'
    end
    visit example_path
    expect(page).not_to have_content 'Bootstrap Toast'
    expect(page).not_to have_content 'I`m a toast'
  end

  it 'reveals toast when show_on event is triggered' do
    matestack_render do
      bs_toast header: 'Bootstrap Toast', body: 'I`m a toast', show_on: 'show_toast', autohide: false
    end
    visit example_path
    expect(page).not_to have_content 'Bootstrap Toast'
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).to have_content 'Bootstrap Toast'
  end

  it 'hide toast when hide_on event is triggered' do
    matestack_render do
      bs_toast header: 'Bootstrap Toast', body: 'I`m a toast', show_on: 'show_toast', hide_on: 'hide_toast'
    end
    visit example_path
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).to have_content 'Bootstrap Toast'
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("hide_toast")')
    expect(page).not_to have_content 'Bootstrap Toast'
  end

  it 'has a header with a subtitle' do
    matestack_render do
      bs_toast header: { title: 'Bootstrap Toast', subtitle: "11 mins ago" }, body: 'I`m a toast', show_on: 'show_toast'
    end
    visit example_path
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).to have_content 'Bootstrap Toast'
    expect(page).to have_content '11 mins ago'
  end

  it 'shows after a delay' do
    matestack_render do
      bs_toast header: "Bootstrap Toast", body: 'I`m a toast', show_on: 'show_toast', delay: 1000
    end
    visit example_path
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).not_to have_content 'Bootstrap Toast'
    sleep 1
    expect(page).to have_content 'Bootstrap Toast'
  end

  it 'is not animated' do
    matestack_render do
      bs_toast header: "Bootstrap Toast", body: 'I`m a toast', show_on: 'show_toast', animation: false
    end
    visit example_path
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).to have_content 'Bootstrap Toast'
    expect(page).to have_selector('[data-bs-animation=false]')
  end

  it 'is not hiding automatically' do
    matestack_render do
      bs_toast header: "Bootstrap Toast", body: 'I`m a toast', show_on: 'show_toast', autohide: false
    end
    visit example_path
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).to have_content 'Bootstrap Toast'
    expect(page).to have_selector('div.toast[data-bs-autohide=false]')
  end

end
