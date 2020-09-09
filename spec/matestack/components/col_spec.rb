require 'rails_helper'

describe 'Components::Col', type: :feature, js: true do
  include Utils

  it 'renders default column' do
    matestack_render do
      row do
        col do         
          btn text: "Button A"
        end
        col do    
          btn text: "Button B"      
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.col')
  end

  it 'renders column with breakpoints & alignment' do
    matestack_render do
      row do
        col default: 12, lg: 4, align_self: :center do
          btn text: "Button A"
        end
        col default: 12, md: 6, align_self: :start do
          btn text: "Button B"      
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.col-12.col-lg-4.align-self-center')
    expect(page).to have_selector('div.col-12.col-md-6.align-self-start')
  end
end