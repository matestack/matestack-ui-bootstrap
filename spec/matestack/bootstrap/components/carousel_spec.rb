require 'rails_helper'

describe 'Bootstrap::Components::Carousel', type: :feature, js: true do
  include Utils

  it 'renders a carousel with slides' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png") },
        { path: image_url("matestack-data.png") }
      ]
      carousel items: items 
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

  it 'can have caption on carousel' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide", text: "Carousel First Text Caption" },
        { path: image_url("matestack-data.png"), title: "Second slide", text: "Carousel Second Text Caption" }
      ]
      carousel items: items
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_content('First slide') 
    expect(page).to have_content('Carousel First Text Caption') 
    expect(page).to_not have_content('Second slide')
  end

  it 'renders a carousel with faded animation and start at 2nd item' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide", text: "Carousel First Text Caption" },
        { path: image_url("matestack-data.png"), title: "Second slide", text: "Carousel Second Text Caption" }
      ]
      carousel fade: true, start: 1, items: items
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide.carousel-fade[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_content('Second slide') 
    expect(page).to_not have_content('Carousel First Text Caption') 
    expect(page).to_not have_content('First slide')
  end

  it 'can have different interval' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide", interval: 20000 },
        { path: image_url("matestack-data.png"), title: "Second slide", interval: 5000 }
      ]
      carousel items: items
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item', count: 2, visible: false)
    expect(page).to have_content('First slide') 
    expect(page).to_not have_content('Second slide')
  end

  it 'renders a carousel with indicators, controls' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png") },
        { path: image_url("matestack-data.png") }
      ]
      carousel controls: true, indicators: true, items: items
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('ol.carousel-indicators')
    expect(page).to have_selector('a.carousel-control-next')
    expect(page).to have_selector('a.carousel-control-prev')
  end

  it 'can be switch item of the carousel per event' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide" },
        { path: image_url("matestack-data.png"), title: "Second slide" }
      ]
      carousel prev_on: "prev-carousel", next_on: "next-carousel", items: items
      onclick emit: "prev-carousel" do btn text: "Prev" end
      onclick emit: "next-carousel" do btn text: "Next" end
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item', count: 2, visible: false)
    expect(page).to have_content('Prev') 
    expect(page).to have_content('Next') 
    expect(page).to have_content('First slide') 
    expect(page).to_not have_content('Second slide')
    click_button('Next')
    expect(page).to have_content('Second slide') 
  end
end