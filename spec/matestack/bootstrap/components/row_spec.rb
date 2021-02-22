require 'rails_helper'

describe 'Bootstrap::Layout::Row', type: :feature, js: true do
  include Utils

  it 'should create a simple row' do
    matestack_render { bs_row }
    visit example_path
    expect(page).to have_selector('div.row')
  end
  it 'should create a row with vertical alignment' do
    matestack_render {
      bs_row horizontal: :center, class: "bg-secondary px-3" do
        plain "Row"
      end
    }
    visit example_path
    expect(page).to have_selector('div.row.justify-content-center')
  end
  it 'should create a row with horizontal alignment' do
    matestack_render {
      bs_row vertical: :start do
        plain "Row"
      end
    }
    visit example_path
    expect(page).to have_selector('div.row.align-items-start')
  end
  it 'should create a row with custom classes' do
    matestack_render {
      bs_row class: "bg-secondary" do
        plain "Row"
      end
    }
    visit example_path
    expect(page).to have_selector('div.row.bg-secondary')
  end
end
