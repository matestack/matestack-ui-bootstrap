require 'rails_helper'

RSpec.describe "Bootstrap::Components::Toasts", type: :feature, js: true do
  include Utils

  it 'toast is not shown on initial page load' do
    matestack_render do
      toast t_title: 'Bootstrap Toast', t_text: '11 mins ago', message: 'I`m a toast'
    end
    visit example_path
    expect(page).not_to have_content 'Bootstrap Toast'
    expect(page).not_to have_content '11 mins ago'
    expect(page).not_to have_content 'I`m a toast'
  end
  
  it 'reveals toast when show_on event is triggered' do
    matestack_render do
      toast t_title: 'Bootstrap Toast', t_text: '11 mins ago', message: 'I`m a toast',
        show_on: 'show_toast'
    end
    visit '/example'
    expect(page).not_to have_content 'Bootstrap Toast'
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show_toast")')
    expect(page).to have_content 'Bootstrap Toast'
  end

end
