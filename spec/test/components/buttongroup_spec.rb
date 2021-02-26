require 'rails_helper'

describe 'Bootstrap::Components::ButtonGroup', type: :feature, js: true do
  include Utils

  it 'renders a button group as default' do
    matestack_render { bs_btn_group do bs_btn end }
    visit example_path
    expect(page).to have_selector('div.btn-group')
  end

  it 'is possible to add a custom class' do
    matestack_render { bs_btn_group class: :foobar do bs_btn end }
    visit example_path
    expect(page).to have_selector('div.btn-group.foobar')
  end

  it 'is possible to change its size and aria label' do
    matestack_render do
      bs_btn_group size: :sm, label: "buttongroup" do
        bs_btn text: "Tab 4"
        bs_btn text: "Tab 4"
      end
    end
    visit example_path
    expect(page).to have_selector('div.btn-group.btn-group-sm[aria-label=buttongroup]')
    expect(page).to have_selector('button.btn.btn-primary')
  end

  it 'can render a button group vertical' do
    matestack_render do
      bs_btn_group vertical: true, label: "Vertical Example" do
        bs_btn text: "Tab 4"
        bs_btn text: "Tab 5"
        bs_btn text: "Tab 6"
      end
    end
    visit example_path
    expect(page).to have_selector('div.btn-group-vertical')
    expect(page).to have_selector('button.btn.btn-primary')
  end

  it 'is possible to render a toolbar' do
    matestack_render do
      bs_btn_group toolbar: true, label: "Toolbar" do
        bs_btn_group label: "Basic Example" do
          bs_btn text: "Tab 3"
        end
        bs_btn_group label: "Basic Example 2" do
          bs_btn text: "Tab 6"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.btn-toolbar')
    expect(page).to have_selector('button.btn.btn-primary')
  end
end
