require 'rails_helper'

describe 'Bootstrap::Components::Badge', type: :feature, js: true do
  include Utils

  it 'renders a secondary badge as default' do
    matestack_render { bs_badge text: "2" }
    visit example_path
    expect(page).to have_selector('span.badge.bg-secondary')
  end

  it 'renders simple badge with variant' do
    matestack_render { bs_badge variant: :warning, text: "warning" }
    visit example_path
    expect(page).to have_selector('span.badge.bg-warning', text: 'warning')
  end

  it 'renders button with round badge and set sr_only message' do
    matestack_render do
      bs_btn text: "Button" do
        bs_badge text: "2", variant: :secondary, visually_hidden: "unread message"
      end
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary')
    expect(page).to have_selector('button > span.badge.bg-secondary')
    expect(page).to have_selector('button > span.badge + span.visually-hidden ')
  end

end
