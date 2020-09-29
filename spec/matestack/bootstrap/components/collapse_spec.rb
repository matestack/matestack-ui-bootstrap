require 'rails_helper'

describe 'Bootstrap::Components::Carousel', type: :feature, js: true do
  include Utils

  it 'renders an empty default collapse' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end

  it 'can contain simple text content inside a card' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end 

  it 'can be triggered from multiple targets' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end 

  it 'is possible to change the aria-labelledby content' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end 

  it 'is possible to set a parent' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end

  it 'can contain some text and set a custom card class' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end

  it 'can have a custom class' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end

  it 'can be toggled on event' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end
  it 'can be shown on event' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end

  it 'can be hiden on event' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end
  
  it 'can be disposed on event' do
    matestack_render do
      collapse
    end
    visit example_page
    expect(page).to have_selector('')
  end

end