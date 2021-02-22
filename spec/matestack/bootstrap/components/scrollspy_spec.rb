require 'rails_helper'

RSpec.describe "Bootstrap::Components::Scrollspy", type: :feature, js: true do
  include Utils

  it 'renders basic scrollspy element' do
    matestack_render do
      bs_scrollspy
    end
    visit example_path
    expect(page).to have_selector('div[data-spy="scroll"]', visible: false)
  end

  it 'with basic elements' do
    matestack_render do
      bs_list_group id: "list-example3", items: [
          { type: :link, text: "Item 1", path: "#list-item1"},
          { type: :link, text: "Item 2", path: "#list-item2" }
        ]
      bs_scrollspy target: "#list-example3" do
        heading size: 2, id: "list-item1", text: "Item 1"
        paragraph text: "Text for item 1"
        heading size: 2, id: "list-item2", text: "Item 2"
        paragraph text: "Text for item 2"
      end
    end
    visit example_path
    expect(page).to have_selector('div[data-target="#list-example3"]')
    expect(page).to have_content('Text for item 1')
    click_on('Item 2')
    expect(page).to have_content('Text for item 2')
    # TODO: How to test the scrolling functionality?
  end

  it 'can have custom method' do
    matestack_render do
      bs_scrollspy method: "foobar"
    end
    visit example_path
    expect(page).to have_selector('div[data-method="foobar"]', visible: false)
  end

  it 'can have an offset' do
    matestack_render do
      bs_scrollspy offset: 100
    end
    visit example_path
    expect(page).to have_selector('div[data-offset="100"]', visible: false)
  end

  it 'can have custom class' do
    matestack_render do
      bs_scrollspy class: "foo bar"
    end
    visit example_path
    expect(page).to have_selector('.foo.bar', visible: false)
  end
end
