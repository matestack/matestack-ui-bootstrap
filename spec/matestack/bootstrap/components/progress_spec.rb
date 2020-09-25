require 'rails_helper'

describe 'Bootstrap::Components::Progress', type: :feature, js: true do
  include Utils

  it 'basic progress bar with text' do
    matestack_render do
      progress value: 50, text: "50%"
    end
    visit example_path
    expect(page).to have_selector('div.progress')
    expect(page).to have_selector('div.progress-bar.bg-primary[role=progressbar]')
    expect(page).to have_css('div.progress-bar[aria-valuenow="50"]')
    expect(page).to have_css('div.progress-bar[aria-valuemin="0"]')
    expect(page).to have_css('div.progress-bar[aria-valuemax="100"]')
  end

  it 'has custom valuemin and valuemax' do
    matestack_render do
      progress value: 50, text: "50%", valuemin: 10, valuemax: 70
    end
    visit example_path
    expect(page).to have_selector('div.progress-bar.bg-primary[role=progressbar]')
    expect(page).to have_css('div.progress-bar[aria-valuenow="50"]')
    expect(page).to have_css('div.progress-bar[aria-valuemin="10"]')
    expect(page).to have_css('div.progress-bar[aria-valuemax="70"]')
  end

  it 'has custom height' do
    matestack_render do
      progress height: 40, value: 30
    end
    visit example_path
    expect(page).to have_css('div.progress.p-0[style="height: 40px"]')
    expect(page).to have_selector('div.progress-bar.bg-primary[role=progressbar]')
  end

  it 'has custom color' do
    matestack_render do
      progress color: :secondary, value: 30
      progress color: :success, value: 30
    end
    visit example_path
    expect(page).to have_css('div.progress.p-0')
    expect(page).to have_selector('div.progress-bar.bg-secondary[role=progressbar]')
    expect(page).to have_selector('div.progress-bar.bg-success[role=progressbar]')
  end

  it 'is striped and animated' do
    matestack_render do
      progress value: 30, striped: true, animated: true
    end
    visit example_path
    expect(page).to have_css('div.progress.p-0')
    expect(page).to have_selector('div.progress-bar.bg-primary.progress-bar-striped.progress-bar-animated[role=progressbar]')
  end

  it 'has multiple progress bar using slot option' do
    matestack_render do
      progress height: 30, slots: { custom_bar: slot {
        div class: "progress-bar bg-success", attributes: { 'role': "progressbar", 'style': "width: 15%" } do
          plain "15%"
        end
        div class: "progress-bar bg-info", attributes: { 'role': "progressbar", 'style': "width: 30%" } do
          plain "35%"
        end
      } }
    end
    visit example_path
    expect(page).to have_content('15%')
    expect(page).to have_selector('div.progress-bar.bg-success')
    expect(page).to have_content('35%')
    expect(page).to have_selector('div.progress-bar.bg-info')
  end

  it 'has custom bar classes and bar attributes' do
    matestack_render do
      progress value: 30, bar_class: "foobar", bar_attributes: { type: "foobar"}
    end
    visit example_path
    expect(page).to have_css('div.progress.p-0')
    expect(page).to have_selector('div.progress-bar.bg-primary.foobar[type=foobar]')
  end
end