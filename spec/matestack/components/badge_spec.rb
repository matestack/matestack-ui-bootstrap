require 'rails_helper'

describe 'Components::Badge', type: :feature, js: true do
  include Utils

  it 'renders simple badge with color' do
    matestack_render do
      badge color: :warning, text: "warning"
    end
    visit '/example'
    expect(page).to have_selector('span.badge.bg-warning')
  end

  it 'renders button with round badge' do
    matestack_render do
      btn text: "Button" do
        badge text: "2", color: :secondary, sr_only: "unread message"
      end
    end
    visit '/example'
    expect(page).to have_selector('button.btn.btn-primary')
    expect(page).to have_selector('span.badge.bg-secondary')
    expect(page).to have_selector('span.sr-only')
  end
end