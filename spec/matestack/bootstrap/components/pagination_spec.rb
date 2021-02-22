require 'rails_helper'

RSpec.describe "Bootstrap::Components::Pagination", type: :feature, js: true do
  include Utils

  it 'renders basic pagination' do
    matestack_render do
      bs_pagination
    end
    visit example_path
    expect(page).to have_selector('nav > ul.pagination', visible: false)
  end

  it 'can render pagination from item list with active item' do
    matestack_render do
      bs_pagination items: [
        { type: :link, path: "#", text: "1", active: false },
        { type: :link, path: "#", text: "2", active: true },
        { type: :link, path: "#", text: "3", active: false }
      ]
    end
    visit example_path
    expect(page).to have_selector('nav > ul.pagination')
    expect(page).to have_selector('li.page-item.active', count: 1)
    expect(page).to have_selector('li.page-item', count: 3)
    expect(page).to have_selector('a.page-link')
  end

  it 'can have custom content given in a block' do
    matestack_render do
      bs_pagination do
        plain "Test Block"
      end
    end
    visit example_path
    expect(page).to have_selector('nav > ul.pagination')
    expect(page).to_not have_selector('li.page-item')
    expect(page).to have_content('Test Block')
  end

  it 'renders the block after the item list' do
    matestack_render do
      bs_pagination items: [
        { type: :link, path: "#", text: "1", active: false },
        { type: :link, path: "#", text: "2", active: false },
        { type: :link, path: "#", text: "3", active: false }
      ] do
        paragraph text: "Test Block"
      end
    end
    visit example_path
    expect(page).to have_selector('nav > ul.pagination > p')
    expect(page).to have_selector('nav > ul.pagination > li.page-item')
    expect(page).to have_content('Test Block')
  end

  it 'can have different sizes' do
    matestack_render do
      bs_pagination items: [
        { type: :link, path: "#", text: "1", active: false },
        { type: :link, path: "#", text: "2", active: false }
      ], size: :sm
    end
    visit example_path
    expect(page).to have_selector('nav > ul.pagination.pagination-sm')
    expect(page).to have_selector('a.page-link')
  end

  it 'has a custom aria_label' do
    matestack_render do
      bs_pagination items: [
        { type: :link, path: "#", text: "1", active: false },
        { type: :link, path: "#", text: "2", active: false },
        { type: :link, path: "#", text: "3", active: false }
      ], aria_label: "Custom Aria Label"
    end
    visit example_path
    expect(page).to have_selector('nav[aria-label="Custom Aria Label"]')
  end

end
