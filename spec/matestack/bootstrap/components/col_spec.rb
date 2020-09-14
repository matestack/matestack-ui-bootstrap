require 'rails_helper'

describe 'Bootstrap::Components::Col', type: :feature, js: true do
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

  it 'renders column with order & offset' do
    matestack_render do
      row do
        col sm: 12, md: 4, lg: 4 do          
          paragraph text: "Test 1"
        end
        col sm: 12, md: 4, lg: 4, order_lg: 5 do          
          paragraph text: "Test 2"
        end
        col md: 4, order_lg: 1, offset: 2 do
          paragraph text: "Test 3"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.col-sm-12.col-md-4.col-lg-4.order-lg-5')
    expect(page).to have_selector('div.col-md-4.order-lg-1.offset-2')
  end

  
end