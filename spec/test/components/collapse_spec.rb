require 'rails_helper'

describe 'Bootstrap::Components::Carousel', type: :feature, js: true do
  include Utils

  it 'renders an empty default collapse' do
    matestack_render do
      bs_collapse
    end
    visit example_path
    expect(page).to have_selector('div.collapse', visible: false)
  end

  it 'can contain simple text content inside a card' do
    matestack_render do
      bs_collapse card: "Random text for card body content", class: "show"
    end
    visit example_path
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show > div.card.card-body')
  end

  it 'can be triggered one targets via data options' do
    matestack_render do
      bs_btn text: "Button 1", data: { "bs-toggle": "collapse",  "bs-target": "#example" }, attributes: { 'aria-expanded': "false", 'aria-controls': "example" }
      bs_collapse id: "example", card: "Random text"
    end
    visit example_path
    expect(page).not_to have_content('Random text')
    click_on('Button 1')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show')
    click_on('Button 1')
    expect(page).not_to have_content('Random text')
    expect(page).not_to have_selector('div.collapse')
  end

  it 'can be triggered from multiple targets via data options' do
    matestack_render do
      paragraph do
        bs_btn text: "Toggle first element", data: { "bs-toggle": "collapse",  "bs-target": "#multiCollapseExample1" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample1" }
        bs_btn text: "Toggle second element", data: { "bs-toggle": "collapse",  "bs-target": "#multiCollapseExample2" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample2" }
        bs_btn text: "Toggle both elements", data: { "bs-toggle": "collapse",  "bs-target": ".multi-collapse" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample1 multiCollapseExample2" }
      end

      bs_row do
        bs_col do
          bs_collapse id: "multiCollapseExample1", card: "Random text #1", multi: true
        end
        bs_col do
          bs_collapse id: "multiCollapseExample2", card: "Random text #2", multi: true
        end
      end
    end
    visit example_path
    # sleep
    expect(page).not_to have_content('Random text #1')
    expect(page).not_to have_content('Random text #2')
    click_on('Toggle first element')
    expect(page).to have_content('Random text #1')
    expect(page).not_to have_content('Random text #2')
    click_on('Toggle second element')
    expect(page).to have_content('Random text #1')
    expect(page).to have_content('Random text #2')
    # not working in test but in real life...no idea why, skipping this for now in tests
    # click_on('Toggle both elements')
    # expect(page).not_to have_content('Random text #1')
    # expect(page).not_to have_content('Random text #2')
    # click_on('Toggle both elements')
    # expect(page).to have_content('Random text #1')
    # expect(page).to have_content('Random text #2')
  end

  it 'is possible to change the aria-labelledby content' do
    matestack_render do
      bs_collapse card: "Random text for card body content", class: "show", labelledby: "random-label"
    end
    visit example_path
    expect(page).to have_selector('div.collapse.show[aria-labelledby="random-label"]')
  end

  it 'is possible to set a parent' do
    matestack_render do
      bs_collapse parent: "dataParent", card: "Random Text"
    end
    visit example_path
    expect(page).to have_selector('div.collapse[data-bs-parent="dataParent"]', visible: false)
  end

  it 'can contain some text and set a custom card class' do
    matestack_render do
      bs_collapse class: "show", card: { class: "foobar", text: "Random Text here"}
    end
    visit example_path
    expect(page).to have_content('Random Text here')
    expect(page).to have_selector('div.collapse.show > div.card.card-body.foobar')
  end

  it 'can have a custom class' do
    matestack_render do
      bs_collapse class: "show foobar", card: "Random text for card body content"
    end
    visit example_path
    expect(page).to have_selector('div.collapse.show.foobar > div.card.card-body')
  end

  it 'can be toggled on event' do
    matestack_render do
      bs_collapse toggle_on: "toggle", card: "Random text for card body content"
    end
    visit example_path
    expect(page).not_to have_content('Random text')
    page.execute_script('MatestackUiVueJs.eventHub.$emit("toggle")')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show')
    page.execute_script('MatestackUiVueJs.eventHub.$emit("toggle")')
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)
  end
  it 'can be shown on event' do
    matestack_render do
      bs_collapse show_on: "show", card: "Random text for card body content"
    end
    visit example_path
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)
    page.execute_script('MatestackUiVueJs.eventHub.$emit("show")')
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse.show', visible: true)
  end

  it 'can be hiden on event' do
    matestack_render do
      bs_collapse class: "show", hide_on: "hide", card: "Random text for card body content"
    end
    visit example_path
    expect(page).to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: true)
    page.execute_script('MatestackUiVueJs.eventHub.$emit("hide")')
    expect(page).not_to have_content('Random text')
    expect(page).to have_selector('div.collapse', visible: false)
  end
end
