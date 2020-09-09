require 'rails_helper'

describe 'Components::ButtonGroup', type: :feature, js: true do
  include Utils

  it 'renders simple button group' do
    matestack_render do
      btn_group size: :sm, label: "Basic Example" do 
        btn text: "Tab 4"
        btn text: "Tab 5"
        btn text: "Tab 6"
      end
    end
    visit example_path
    expect(page).to have_selector('div.btn-group.btn-group-sm')
    expect(page).to have_selector('button.btn.btn-primary')
  end

  it 'renders simple button group vertical' do
    matestack_render do
      btn_group vertical: true, label: "Vertical Example" do 
        btn text: "Tab 4"
        btn text: "Tab 5"
        btn text: "Tab 6"
      end
    end
    visit example_path
    expect(page).to have_selector('div.btn-group-vertical')
    expect(page).to have_selector('button.btn.btn-primary')
  end

  it 'renders button group toolbar' do
    matestack_render do
      btn_group type: :toolbar, label: "Toolbar" do            
        btn_group type: :group, label: "Basic Example" do 
          btn text: "Tab 1"
          btn text: "Tab 2"
          btn text: "Tab 3"
        end
        btn_group type: :group, label: "Basic Example 2" do 
          btn text: "Tab 4"
          btn text: "Tab 5"
          btn text: "Tab 6"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.btn-toolbar')
    expect(page).to have_selector('button.btn.btn-primary')
  end
end