require 'rails_helper'

describe 'Bootstrap::Components::ListGroup', type: :feature, js: true do
  include Utils
  
  it 'renders basic listgroup' do
    matestack_render do 
      list_group 
    end
    visit example_path
    expect(page).to have_selector('ul.list-group')
  end

  it 'renders listgroup with links' do
    matestack_render do 
      list_group id: "list-example3", items: [
        { type: :link, path: "#list-item1", text: "Item 1" },
        { type: :link, path: "#list-item2", text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_link('Item 1', href: '#list-item1')
    expect(page).to have_selector('a.list-group-item.list-group-item-action')
  end

  it 'renders listgroup with transitions' do
    matestack_render do 
      list_group id: "list-example3", items: [
        { type: :transition, path: "#list-item1", text: "Item 1" },
        { type: :transition, path: "#list-item2", text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_link('Item 1', href: '#list-item1')
    expect(page).to have_selector('a.list-group-item.list-group-item-action')
  end

  it 'renders listgroup with labels' do
    matestack_render do 
      list_group id: "list-example3", items: [
        { type: :label, text: "Item 1" },
        { type: :label, text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('label.list-group-item')
  end

  it 'can be displayed horozintally with a different size' do
    matestack_render do 
      list_group id: "list-example3", horizontal: true, horizontal_size: :md, 
      items: [
        { type: :label, text: "Item 1" },
        { type: :label, text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('list-group.list-group-horizontal-md')
  end

  it 'is possible to display it flush' do
    matestack_render do 
      list_group id: "list-example3", flush: true, 
      items: [
        { type: :label, text: "Item 1" },
        { type: :label, text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('list-group.list-group-flush')
  end

  it 'is possible to display as tablist' do
    matestack_render do 
      list_group id: "list-example3", tablist: true, 
      items: [
        { type: :label, text: "Item 1" },
        { type: :label, text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('list-group[role=tablist]')
  end

  it 'is possible to activate checkboxes' do
    matestack_render do 
      list_group id: "list-example3", checkbox: true,
      items: [
        { type: :label, text: "Item 1" },
        { type: :label, text: "Item 2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('list-group')
    expect(page).to have_selector('input.form-check-input.mr-1')
  end

  it 'is possible to add custom class for list group and individual list items' do
    matestack_render do 
      list_group id: "list-example3", class: "foobar",
      items: [
        { type: :label, text: "Item 1", class: "foo1" },
        { type: :label, text: "Item 2", class: "foo2" } 
      ]
    end
    visit example_path
    expect(page).to have_content('Item 1')
    expect(page).to have_content('Item 2')
    expect(page).to have_selector('list-group.foobar')
    expect(page).to have_selector('label.list-group-item.foo1')
    expect(page).to have_selector('label.list-group-item.foo2')
  end

end