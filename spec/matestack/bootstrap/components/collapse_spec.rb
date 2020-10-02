require 'rails_helper'

describe 'Bootstrap::Components::Carousel', type: :feature, js: true do
  include Utils

  it 'renders an empty default collapse' do
    matestack_render do
      collapse
    end
    visit example_path
    expect(page).to have_selector('div.collapse', visible: false)
  end

  it 'can contain simple text content inside a card' do
    matestack_render do
      collapse card: "Random text for card body content", class: "show"
    end
    visit example_path
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show > div.card.card-body')
  end 

  it 'can be triggered from multiple targets via data options' do
    matestack_render do
      btn text: "Button 1", data: { toggle: "collapse",  target: ".multi-collapse" }, attributes: { 'aria-expanded': false, 'aria-controls': "multiCollapseExample" }
      btn text: "Button 2", data: { toggle: "collapse",  target: ".multi-collapse" }, attributes: { 'aria-expanded': false, 'aria-controls': "multiCollapseExample" }
      collapse id: "multiCollapseExample", card: "Random text for card body content", multi: true
    end
    visit example_path
    expect(page).not_to have_content('Random text')
    click_on('Button 1')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show')
    click_on('Button 2')
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)
    click_on('Button 2')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show', visible: true)
  end

  it 'is possible to change the aria-labelledby content' do
    matestack_render do
      collapse card: "Random text for card body content", class: "show", labelledby: "random-label"
    end
    visit example_path
    expect(page).to have_selector('div.collapse.show[aria-labelledby="random-label"]')
  end 

  it 'is possible to set a parent' do
    matestack_render do
      collapse parent: "dataParent", card: "Random Text"
    end
    visit example_path
    expect(page).to have_selector('div.collapse[data-parent="dataParent"]', visible: false)
  end

  it 'can contain some text and set a custom card class' do
    matestack_render do
      collapse class: "show", card: { class: "foobar", text: "Random Text here"}
    end
    visit example_path
    expect(page).to have_content('Random Text here') 
    expect(page).to have_selector('div.collapse.show > div.card.card-body.foobar')
  end

  it 'can have a custom class' do
    matestack_render do
      collapse class: "show foobar", card: "Random text for card body content"
    end
    visit example_path
    expect(page).to have_selector('div.collapse.show.foobar > div.card.card-body')
  end

  it 'can be toggled on event' do
    matestack_render do
      collapse toggle_on: "toggle", card: "Random text for card body content"
    end
    visit example_path
    expect(page).not_to have_content('Random text')
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("toggle")')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show')
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("toggle")')
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)
  end
  it 'can be shown on event' do
    matestack_render do
      collapse show_on: "show", card: "Random text for card body content"
    end
    visit example_path
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)  
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("show")')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show', visible: true)  
  end

  it 'can be hiden on event' do
    matestack_render do
      collapse class: "show", hide_on: "hide", card: "Random text for card body content"
    end
    visit example_path
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: true)  
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("hide")')
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)  
  end
end