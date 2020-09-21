require 'rails_helper'

describe 'Bootstrap::Components::Carousel', type: :feature, js: true do
  include Utils

  it 'renders a carousel with slides' do
    matestack_render do
      carousel items: [
          { path: image_url("matestack-data.png") },
          { path: image_url("matestack-data.png") }
        ]
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item', count: 2, visible: false)
    expect(page).to have_selector('div.carousel-item', count: 1)
    expect(page).to have_selector('div.carousel-item.active', count: 1)
    expect(page).to have_selector('div.carousel-item > img', count: 2, visible: false)
    expect(page).to have_selector('div.carousel-item > img', count: 1)
  end

end