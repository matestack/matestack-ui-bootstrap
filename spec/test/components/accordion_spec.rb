require 'rails_helper'

RSpec.describe "Bootstrap::Components::Accordion", type: :feature, js: true do
  include Utils

  it 'can expand and collapse with multiple elements, all hidden by default' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #1" }, body: { text: "Random Text for Collapse #1" } },
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2" } }
      ]
    end
    visit example_path
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header > .accordion-button', text: "Group Item #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header > .accordion-button', text: "Group Item #2", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #1", visible: false)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #2", visible: false)
    click_on('Group Item #1')
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #2", visible: false)
    click_on('Group Item #2')
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #2", visible: true)
    click_on('Group Item #1')
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #1", visible: false)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #2", visible: true)
  end

  it 'can expand and collapse with multiple elements, all shown when open true' do
    matestack_render do
      bs_accordion open: true, items: [
        { header: { text: "Group Item #1" }, body: { text: "Random Text for Collapse #1" } },
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2" } }
      ]
    end
    visit example_path
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header > .accordion-button', text: "Group Item #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header > .accordion-button', text: "Group Item #2", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #2", visible: true)
  end

  it 'can expand and collapse with multiple elements, only specified items are shown initially' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #1" }, body: { text: "Random Text for Collapse #1" }, open: true },
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2" } }
      ]
    end
    visit example_path
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header > .accordion-button', text: "Group Item #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header > .accordion-button', text: "Group Item #2", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #1", visible: true)
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body', text: "Random Text for Collapse #2", visible: false)
  end

  it 'can render in flush variant' do
    matestack_render do
      bs_accordion variant: :flush, items: [
        { header: { text: "Group Item #1" }, body: { text: "Random Text for Collapse #1" }, open: true },
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2" } }
      ]
    end
    visit example_path
    expect(page).to have_selector('.accordion.accordion-flush')
  end

  it 'item header can have custom class' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #2", class: "foobar" }, body: { text: "Random Text for Collapse #2" } },
      ]
    end
    visit example_path
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-header.foobar > .accordion-button', text: "Group Item #2", visible: true)
  end

  it 'item body can have custom class' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2", class: "foobar" } },
      ]
    end
    visit example_path
    expect(page).to have_selector('.accordion > .accordion-item > .accordion-collapse > .accordion-body.foobar', text: "Random Text for Collapse #2", visible: false)
  end

end
