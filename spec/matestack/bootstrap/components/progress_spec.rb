require 'rails_helper'

describe 'Bootstrap::Components::Progress', type: :feature, js: true do
  include Utils

  it 'default progress bar with as primary' do
    matestack_render do
      progress progress: 50
    end
    visit example_path
    expect(page).to have_selector('div.progress')
    expect(page).to have_selector('div.progress > div.progress-bar.bg-primary[role=progressbar]')
    expect(page).to have_css('div.progress-bar[aria-valuenow="50"]')
    expect(page).to have_css('div.progress-bar[style="width: 50%;"]')
    expect(page).to have_css('div.progress-bar[aria-valuemin="0"]')
    expect(page).to have_css('div.progress-bar[aria-valuemax="100"]')
  end

  it 'can render a default progress bar with text' do
    matestack_render { progress progress: 50, text: '50%' }
    visit example_path
    expect(page).to have_selector('div.progress-bar', text: '50%')
  end
  
  it 'is possible to either set value or progress' do
    matestack_render do 
      progress progress: 50, text: '50%'
      progress value: 40, text: '40%'
    end
    visit example_path
    expect(page).to have_css('div.progress-bar[aria-valuenow="50"]', text: '50%')
    expect(page).to have_css('div.progress-bar[style="width: 50%;"]', text: '50%')
    expect(page).to have_css('div.progress-bar[aria-valuenow="40"]', text: '40%')
    expect(page).to have_css('div.progress-bar[style="width: 40%;"]', text: '40%')
  end

  it 'can set a valuemin and valuemax' do
    matestack_render { progress progress: 50, valuemin: 10, valuemax: 70 }
    visit example_path
    expect(page).to have_selector('div.progress-bar.bg-primary[role=progressbar]')
    expect(page).to have_css('div.progress-bar[aria-valuenow="50"]')
    expect(page).to have_css('div.progress-bar[aria-valuemin="10"]')
    expect(page).to have_css('div.progress-bar[aria-valuemax="70"]')
  end

  it 'is possible to change its height' do
    matestack_render do
      progress height: 40, value: 30
    end
    visit example_path
    expect(page).to have_css('div.progress[style="height: 40px;"]')
    expect(page).to have_selector('div.progress-bar.bg-primary[role=progressbar]')
  end

  it 'is possible to change its appearance' do
    matestack_render { progress variant: :secondary, value: 30 }
    visit example_path
    expect(page).to have_css('div.progress')
    expect(page).to have_selector('div.progress-bar.bg-secondary[role=progressbar]')
  end

  it 'is possible to make it striped and animated' do
    matestack_render do
      progress value: 30, striped: true, animated: true
    end
    visit example_path
    expect(page).to have_css('div.progress')
    expect(page).to have_selector('div.progress-bar.bg-primary.progress-bar-striped.progress-bar-animated[role=progressbar]')
  end

  it 'is possible to create multiple progress bars by passing in a list to :progress' do
    matestack_render do
      progress animated: true, variant: :light, progress: [
          { value: 50, text: '50%', variant: :success, striped: true },
          { value: 25, text: '25%', variant: :warning, animated: false },
          { value: 15, text: '15%', class: 'a-class', aria_valuenow: 'some percent' }
        ]
    end
    pending
    fail
  end

  it 'can take a block as content' do
    matestack_render do
      progress() { div class: 'block-content' }
    end
    pending
    fail
  end

  it 'renders progress bars before block' do
    matestack_render do
      progress value: 40, text: '40%' do
        div class: 'block-content'
      end
    end
    pending
    fail
  end

end