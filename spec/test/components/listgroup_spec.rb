require 'rails_helper'

describe 'Bootstrap::Components::ListGroup', type: :feature, js: true do
  include Utils

  it 'renders basic listgroup' do
    matestack_render do
      bs_list_group items: [
        { text: "Item 1" },
        { text: "Item 2" }
      ]
    end
    visit example_path
    expect(page).to have_selector('ul.list-group > li.list-group-item', text: "Item 1")
    expect(page).to have_selector('ul.list-group > li.list-group-item', text: "Item 2")
  end

  it 'renders basic listgroup with color variant per item' do
    matestack_render do
      bs_list_group items: [
        { text: "Item 1" },
        { text: "Item 2", variant: :danger }
      ]
    end
    visit example_path
    expect(page).to have_selector('ul.list-group > li.list-group-item', text: "Item 1")
    expect(page).to have_selector('ul.list-group > li.list-group-item.list-group-item-danger', text: "Item 2")
  end

  it 'renders basic listgroup with icons' do
    matestack_render do
      bs_list_group items: [
        { text: "Item 1" },
        { text: "Item 2", icon: "circle" },
        { icon: "trash", variant: :danger }
      ]
    end
    visit example_path
    expect(page).to have_selector('ul.list-group > li.list-group-item', text: "Item 1")
    within('ul.list-group > li.list-group-item', text: "Item 2") do
      expect(page).to have_selector('svg')
    end
    within('ul.list-group > li.list-group-item.list-group-item-danger') do
      expect(page).to have_selector('svg')
    end
  end

  it 'renders basic listgroup with disabled items' do
    matestack_render do
      bs_list_group items: [
        { text: "Item 1" },
        { text: "Item 2", disabled: true }
      ]
    end
    visit example_path
    expect(page).to have_selector('ul.list-group > li.list-group-item', text: "Item 1")
    expect(page).to have_selector('ul.list-group > li.list-group-item.disabled[aria-disabled=true]', text: "Item 2")
  end

  it 'renders listgroup as div with (disbaled) links' do
    matestack_render do
      bs_list_group id: "list-example3", items: [
        { type: :link, path: "#list-item1", text: "Item 1" },
        { type: :link, path: "#list-item2", text: "Item 2", disabled: true }
      ]
    end
    visit example_path
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#list-item1"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.disabled[href="#list-item2"][aria-disabled=true]', text: "Item 2")
  end

  it 'renders listgroup as div with (disbaled) transitions' do
    pending # need to test for correct transition behaviour
    matestack_render do
      bs_list_group id: "list-example3", items: [
        { type: :transition, path: root_path, text: "Item 1" },
        { type: :transition, path: "#list-item2", text: "Item 2", disabled: true}
      ]
    end
    visit example_path
    expect(page).to have_selector('component[is="matestack-ui-core-transition"]')
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#list-item1"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.disabled[href="#list-item2"][aria-disabled=true]', text: "Item 2")
  end

  # need to test for correct transition behaviour
  it 'renders listgroup as div with (disbaled) actions'

  it 'renders listgroup with labels' do
    matestack_render do
      bs_list_group id: "list-example3", items: [
        { type: :label, text: "Item 1" },
        { type: :label, text: "Item 2" }
      ]
    end
    visit example_path
    expect(page).to have_selector('ul.list-group > label.list-group-item', text: "Item 1")
    expect(page).to have_selector('ul.list-group > label.list-group-item', text: "Item 2")
  end

  it 'is possible to activate checkboxes' do
    pending # this implementation is useless, would need to be connected to a form through bs_form_checkbox
    matestack_render do
      bs_list_group id: "list-example3", checkbox: true,
        items: [
          { type: :label, text: "Item 1" },
          { type: :label, text: "Item 2" }
        ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('.list-group')
    expect(page).to have_selector('input.form-check-input.mr-1')
  end

  it 'can be displayed with badges' do
    matestack_render do
      bs_list_group id: "list-example3",
        items: [
          { text: "Item 1" },
          { text: "Item 2", badge: "42" }
        ]
    end
    visit example_path
    expect(page).to have_selector('ul.list-group > .list-group-item', text: "Item 1")
    within('ul.list-group > li.list-group-item.d-flex.justify-content-between.align-items-center', text: "Item 2") do
      expect(page).to have_selector('span.badge.bg-primary.rounded-pill',  text: "42")
    end
  end


  it 'can be displayed horozintally with a different size' do
    matestack_render do
      bs_list_group id: "list-example3", horizontal: true, horizontal_size: :md,
        items: [
          { type: :label, text: "Item 1" },
          { type: :label, text: "Item 2" }
        ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('.list-group.list-group-horizontal-md')
  end

  it 'is possible to display it as flush variant' do
    matestack_render do
      bs_list_group id: "list-example3", variant: :flush,
        items: [
          { type: :label, text: "Item 1" },
          { type: :label, text: "Item 2" }
        ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('.list-group.list-group-flush')
  end

  it 'is possible to add custom class for list group and individual list items' do
    matestack_render do
      bs_list_group id: "list-example3", class: "foobar",
        items: [
          { type: :label, text: "Item 1", class: "list-group-item-primary" },
          { type: :label, text: "Item 2", class: "list-group-item-secondary" }
        ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('.list-group.foobar')
    expect(page).to have_selector('label.list-group-item.list-group-item-primary')
    expect(page).to have_selector('label.list-group-item.list-group-item-secondary')
  end

  it 'is possible to display as tablist' do
    # pending # active classes do not disappear currently, everything else is working properly
    matestack_render do
      bs_row do
        bs_col lg: 4 do
          bs_list_group id: "list-tab",
            items: [
              { type: :tab, id: :a, text: "Item 1", active: true},
              { type: :tab, id: :b, text: "Item 2" }
            ]
        end
        bs_col lg: 8 do
          bs_tab_nav id: "list" do
            bs_tab_nav_content id: :a, active: true do
              plain "A"
            end
            bs_tab_nav_content id: :b do
              plain "B"
            end
          end
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.active[href="#tab-a-content"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#tab-b-content"]', text: "Item 2")
    expect(page).to have_content('A')
    expect(page).not_to have_content('B')
    click_on 'Item 2'
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#tab-a-content"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.active[href="#tab-b-content"]', text: "Item 2")
    expect(page).not_to have_content('A')
    expect(page).to have_content('B')
    click_on 'Item 1'
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action.active[href="#tab-a-content"]', text: "Item 1")
    expect(page).to have_selector('div.list-group > a.list-group-item.list-group-item-action[href="#tab-b-content"]', text: "Item 2")
    expect(page).to have_content('A')
    expect(page).not_to have_content('B')
  end

end
