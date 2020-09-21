require 'rails_helper'

describe 'Bootstrap::Components::Badge', type: :feature, js: true do
  include Utils

  it 'renders a secondary badge as default' do
    matestack_render {badge}
    pending
    fail
  end

  it 'renders simple badge with variant' do
    matestack_render do
      badge variant: :warning, text: "warning"
    end
    visit example_path
    expect(page).to have_selector('span.badge.bg-warning', text: 'warning')
  end

  it 'renders button with round badge' do
    matestack_render do
      btn text: "Button" do
        badge text: "2", variant: :secondary, sr_only: "unread message"
      end
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary')
    expect(page).to have_selector('span.badge.bg-secondary')
    expect(page).to have_selector('span.sr-only')
  end
  
end