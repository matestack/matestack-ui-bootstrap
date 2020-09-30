require 'rails_helper'

RSpec.describe "Bootstrap::Components::Carousel", type: :feature, js: true do
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
        { path: image_url("matestack-data.png"), title: "First slide", interval: 5000 },
        { path: image_url("matestack-data.png"), title: "Second slide", interval: 8000 }
      ]
      carousel items: items
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item', count: 2, visible: false)
    expect(page).to have_content('First slide') 
    expect(page).to_not have_content('Second slide')
    expect(page).to have_content('Second slide', wait: 6)
    expect(page).to_not have_content('First slide', wait: 6)
    expect(page).to have_content('First slide', wait: 8)
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

  it 'can show next item on event' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide", interval: 10000, title_class: 'text-dark'  },
        { path: image_url("matestack-data.png"), title: "Second slide", interval: 10000, title_class: 'text-dark'  }
      ]
      carousel next_on: "next-carousel", pause_on: "pause", items: items, style: "width: 1000px"
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item', count: 2, visible: false)
    expect(page).to have_content('First slide') 
    expect(page).to_not have_content('Second slide')
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("next-carousel")')
    expect(page).to have_content('Second slide', wait: 2) 
    expect(page).to_not have_content('First slide', wait: 2)
    sleep 0.5
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("next-carousel")')
    expect(page).to have_content('First slide', wait: 2) 
    expect(page).to_not have_content('Second slide', wait: 2)
  end

  it 'can show previous item on event' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide" },
        { path: image_url("matestack-data.png"), title: "Second slide" }
      ]
      carousel prev_on: "prev-carousel", items: items
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item')

    expect(page).to have_content('First slide') 
    expect(page).to_not have_content('Second slide')
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("prev-carousel")')
    expect(page).to have_content('Second slide') 
    expect(page).to_not have_content('First slide')
  end

  it 'can pause on event and restarty cycling after event' do
    matestack_render do
      items = [
        { path: image_url("matestack-data.png"), title: "First slide", title_class: 'text-dark' },
        { path: image_url("matestack-data.png"), title: "Second slide", title_class: 'text-dark' }
      ]
      carousel cycle_on: "cycle-carousel", pause_on: "pause-carousel", items: items, interval: 500, style: "width: 300px"
    end
    visit example_path
    expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
    expect(page).to have_selector('div.carousel-inner')
    expect(page).to have_selector('div.carousel-item')
    expect(page).to have_content('First slide') 
    expect(page).to_not have_content('Second slide')
    sleep 0.75
    page.execute_script('MatestackUiCore.matestackEventHub.$emit("pause-carousel")')
    expect(page).to_not have_content('First slide') 
    expect(page).to have_content('Second slide')
    sleep 0.5
    expect(page).to_not have_content('First slide') 
    expect(page).to have_content('Second slide')

    page.execute_script('MatestackUiCore.matestackEventHub.$emit("cycle-carousel")')
    expect(page).to_not have_content('First slide') 
    expect(page).to have_content('Second slide')
    expect(page).to have_content('First slide', wait: 2) 
    expect(page).to_not have_content('Second slide', wait: 2)
  end
  
  # it 'can be disposed on event' do
  #   pending

  #   matestack_render do
  #     items = [
  #       { path: image_url("matestack-data.png"), title: "First slide" },
  #       { path: image_url("matestack-data.png"), title: "Second slide" }
  #     ]
  #     carousel items: items
  #   end
  #   visit example_path
  #   expect(page).to have_selector('div.carousel.slide[data-ride=carousel]')
  #   expect(page).to have_selector('div.carousel-inner')
  #   expect(page).to have_selector('div.carousel-item')
    
  # end
end