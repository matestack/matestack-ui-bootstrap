require 'rails_helper'

RSpec.describe "Bootstrap::Components::Scrollspy", type: :feature, js: true do
  include Utils

  it 'with basic elements' do
    matestack_render do
      bs_row class: "m-3" do
        bs_col lg: 4 do
          bs_list_group id: "list-example", class: "mb-5", items: [
            { type: :link, text: "Item 1", path: "#list-item1"},
            { type: :link, text: "Item 2", path: "#list-item2" }
          ]
        end
        bs_col lg: 8 do
          bs_scrollspy target: "#list-example", offset: 0, height: 200 do
            heading size: 2, id: "list-item1", text: "Item 1"
            100.times do
              paragraph text: "Text for item 1"
            end
            heading size: 2, id: "list-item2", text: "Item 2"
            100.times do
              paragraph text: "Text for item 2"
            end
          end
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div[data-bs-offset="0"][data-bs-spy="scroll"][data-bs-target="#list-example"][tabindex="0"][style="overflow-y: scroll; position: relative; height: 200px;"]')
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.active[href="#list-item1"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#list-item2"]', text: "Item 2")
    expect(page).to have_selector('h2', text: "Item 1", visible: true)
    expect(page).to have_selector('h2', text: "Item 2", visible: false)
    click_on('Item 2')
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#list-item1"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.active[href="#list-item2"]', text: "Item 2")
    expect(page).to have_selector('h2', text: "Item 1", visible: false)
    expect(page).to have_selector('h2', text: "Item 2", visible: true)
  end

  it 'can have custom method' do
    matestack_render do
      bs_scrollspy height: 200, method: "foobar"
    end
    visit example_path
    expect(page).to have_selector('div[data-bs-method="foobar"]', visible: false)
  end

  it 'can have an offset' do
    matestack_render do
      bs_scrollspy height: 200, offset: 100
    end
    visit example_path
    expect(page).to have_selector('div[data-bs-offset="100"]', visible: false)
  end

  it 'can have custom class' do
    matestack_render do
      bs_scrollspy height: 200, class: "foo bar"
    end
    visit example_path
    expect(page).to have_selector('.foo.bar', visible: false)
  end
end
