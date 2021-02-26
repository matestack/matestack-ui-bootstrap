require 'rails_helper'

describe 'Bootstrap::Components::ListGroup', type: :feature, js: true do
  include Utils

  it 'renders basic dropdown' do
    matestack_render do
      bs_dropdown
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle')
  end

  it 'has custom button with text' do
    matestack_render do
      bs_dropdown variant: :secondary, text: "Dropdown"
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-secondary.dropdown-toggle')
    expect(page).to have_content('Dropdown')
  end

  it 'has a dropdown menu item' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" },
        { type: :divider },
        { type: :link, path: "#", text: "Separated link" }
      ]
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    expect(page).to_not have_content('Nulla vitae elit')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
    expect(page).to have_selector('li > button.btn.btn-primary.dropdown-item')
    expect(page).to have_selector('li > hr.dropdown-divider')
  end

  it 'has a block yiel after menu' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" }
      ] do
        paragraph text: "Test Block"
      end
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    expect(page).to_not have_content('Test Block')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
    expect(page).to have_content('Test Block')
    expect(page).to have_selector('ul.dropdown-menu.show > p')
  end

  it 'has a custom class for menu' do
    matestack_render do
      div attributes: { style: "height: 500px;" } do
        bs_dropdown text: "Dropdown", menu: { items: [
          { type: :link, path: "#", text: "Nulla vitae elit" },
          { type: :button, text: "Action" },
          { type: :divider },
          { type: :link, path: "#", text: "Separated link" }
        ], class: "foobar" }
      end
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
    expect(page).to have_selector('li > button.btn.btn-primary.dropdown-item')
    expect(page).to have_selector('ul.dropdown-menu.foobar')
  end

  it 'can have a  split button using slot' do
    matestack_render do
      bs_dropdown slots: { split_btn: slot {
        bs_btn text: "Split Button"
      } }
    end
    visit example_path
    expect(page).to have_content('Split Button')
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle.dropdown-toggle-split')
  end

  it 'can have different direction' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" },
      ], direction: :right
    end
    visit example_path
    expect(page).to have_selector('div.dropdown.dropright')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
  end

  it 'can have different alignment' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" },
      ], align: :center
    end
    visit example_path
    click_on('Dropdown')
    expect(page).to have_selector('ul.dropdown-menu.dropdown-menu-center')
  end

  it 'can have an offset for menu' do
    matestack_render do
      bs_dropdown offset: "10,22", text: "Dropdown"
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle[data-offset="10,22"]')
    expect(page).to have_content('Dropdown')
  end

  it 'can have action, transition and onclick components as items' do
    matestack_render do
      div attributes: { style: "height: 500px;" } do
        bs_dropdown text: "Dropdown", menu: [
          { type: :link, path: "#", text: "Link" },
          { type: :transition, path: root_path, text: "Transition" },
          { type: :action, path: root_path, method: :post, text: "Action" },
          { type: :onclick, emit: "test", text: "Onclick" }
        ]
      end
    end
    visit example_path
    sleep
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle[data-offset="10,22"]')
    expect(page).to have_content('Dropdown')
  end

end
