require 'rails_helper'

describe 'Bootstrap::Components::Alert', type: :feature, js: true do
  include Utils

  it 'simple spinner with primary color' do
    matestack_render { spinner color: :primary }
    visit example_path
    expect(page).to have_selector('div.spinner-border.text-primary')
  end
  it 'simple grow spinner' do
    matestack_render { spinner type: :grow }
    visit example_path
    expect(page).to have_selector('div.spinner-grow')
  end
  it 'spinner inside a button' do
    matestack_render {
      btn style: :secondary, size: 2, class: "text-center p-4" do
        spinner smaller: true, color: :success
        plain "Loading..."
      end
    }
    visit example_path
    expect(page).to have_content 'Loading...'
    expect(page).to have_selector('div.spinner-border.text-success.spinner-border-sm')
  end
end