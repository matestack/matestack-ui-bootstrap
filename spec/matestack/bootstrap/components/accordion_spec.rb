require 'rails_helper'

RSpec.describe "Bootstrap::Components::Accordion", type: :feature, js: true do
  include Utils

  it 'renders basic accordion' do
    matestack_render do
      bs_accordion
    end
    visit example_path
    expect(page).to have_selector('.accordion')
  end

  it 'can expand and collapse with multiple card elements' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #1" }, body: { text: "Random Text for Collapse #1" } },
        { header: { text: "Group Item #3" }, body: { text: "Random Text for Collapse #3" } }
      ]
    end
    visit example_path
    expect(page).not_to have_content('Random Text for Collapse #1')
    expect(page).not_to have_content('Random Text for Collapse #3')
    click_on('Group Item #1')
    expect(page).to have_content('Random Text for Collapse #1')
    click_on('Group Item #3')
    expect(page).to have_content('Random Text for Collapse #3')
    sleep 0.25
    click_on('Group Item #1')
    expect(page).not_to have_content('Random Text for Collapse #1')
  end

  it 'header can have custom variant' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #1", variant: :light }, body: { text: "Random Text for Collapse #1" } },
      ]
    end
    visit example_path
    expect(page).to have_selector('.btn-light')
  end
  it 'header can have custom class' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #2", class: "foobar" }, body: { text: "Random Text for Collapse #2" } },
      ]
    end
    visit example_path
    expect(page).to have_selector('.foobar')
  end

  it 'body can have custom class' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2", class: "foobar" } },
      ]
    end
    visit example_path
    click_on('Group Item #2')
    expect(page).to have_selector('.card-body.foobar')
  end

  it 'has collapse with multi target' do
    matestack_render do
      bs_accordion items: [
        { header: { text: "Group Item #2" }, body: { text: "Random Text for Collapse #2", multi: true } },
      ]
    end
    visit example_path
    click_on('Group Item #2')
    expect(page).to have_selector('.multi-collapse')
  end
end
