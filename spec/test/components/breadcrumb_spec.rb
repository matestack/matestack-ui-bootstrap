require 'rails_helper'

describe 'Bootstrap::Components::Breadcrumb', type: :feature, js: true do
  include Utils


  let(:items) do [
      { type: :link, path: "/", text: "Item 1" },
      { type: :link, path: "#", text: "Item 2" },
      { text: "Item 3" }
    ]
  end

  it 'is possible to set a custom class' do
    matestack_render { bs_breadcrumb class: 'custom', items: items }
    visit example_path
    expect(page).to have_selector('nav[aria-label=breadcrumb]')
    expect(page).to have_selector('ol.breadcrumb.custom')
  end

  it 'renders breadcrumb with transition' do
    matestack_render do
      bs_breadcrumb items: items
    end
    visit example_path
    expect(page).to have_selector('nav[aria-label=breadcrumb]')
    expect(page).to have_selector('ol.breadcrumb')
    items[0..-2].each do |item|
      expect(page).to have_selector("li.breadcrumb-item > a", text: item[:text])
    end
  end

  it 'renders breadcrumb with link' do
    matestack_render do
      bs_breadcrumb items: items
    end
    visit example_path
    expect(page).to have_selector('nav[aria-label=breadcrumb]')
    items[0..-2].each do |item|
      expect(page).to have_selector("li.breadcrumb-item > a", text: item[:text])
    end
  end

  it 'is possible to render a block inside a breadcrumb' do
    matestack_render do
      bs_breadcrumb do
        paragraph text: 'Custom content'
      end
    end
    visit example_path
    expect(page).to have_selector('nav[aria-label=breadcrumb]')
    expect(page).to have_selector('ol.breadcrumb')
    expect(page).to_not have_selector('li.breadcrumb-item')
    expect(page).to have_selector('p', text: 'Custom content')
  end

  it 'is possible to add a nav class' do
    matestack_render { bs_breadcrumb nav_class: 'custom classes', items: items }
    visit example_path
    expect(page).to have_selector('nav.custom.classes[aria-label=breadcrumb]')
  end

  it 'can be used with items and a block' do
    matestack_render do
      bs_breadcrumb items: [{ path: 'test', text: 'Test'}] do
        paragraph text: 'Custom content'
      end
    end
    visit example_path
    expect(page).to have_selector('ol.breadcrumb > li.breadcrumb-item', text: 'Test')
    # expecting the block content after the rendered list items
    expect(page).to have_selector('ol.breadcrumb > li + p', text: 'Custom content')
  end

end
