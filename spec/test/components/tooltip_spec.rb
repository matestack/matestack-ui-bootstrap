require 'rails_helper'

RSpec.describe "Bootstrap::Components::Tooltip", type: :feature, js: true do
  include Utils

  it 'can wrap other elements as span and shows text message on hover by default' do
    matestack_render do
      bs_tooltip tooltip_title: "Help Message" do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_content('Button')
    expect(page).not_to have_content('Help Message')
    expect(page).to have_selector('span[data-bs-placement="auto"]')
    expect(page).not_to have_selector('div.tooltip', text: 'Help Message')
    find('Button').hover
    expect(page).to have_content('Button')
    expect(page).to have_content('Help Message')
    expect(page).to have_selector('div.tooltip', text: 'Help Message')
  end

  it 'can wrap other elements as div and shows text message on hover by default' do
    matestack_render do
      bs_tooltip tag: :div, tooltip_title: "Help Message" do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_content('Button')
    expect(page).not_to have_content('Help Message')
    expect(page).to have_selector('div[data-bs-placement="auto"]')
    expect(page).not_to have_selector('div.tooltip', text: 'Help Message')
    find('Button').hover
    expect(page).to have_content('Button')
    expect(page).to have_content('Help Message')
    expect(page).to have_selector('div.tooltip', text: 'Help Message')
  end

  it 'appears with a button and a text message on click' do
    matestack_render do
      bs_tooltip tooltip_title: "Help Message", trigger: "click" do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_content('Button')
    expect(page).not_to have_content('Help Message')
    expect(page).to have_selector('span[data-bs-placement="auto"]')
    expect(page).not_to have_selector('div.tooltip', text: 'Help Message')
    find('Button').hover
    expect(page).not_to have_content('Help Message')
    expect(page).not_to have_selector('div.tooltip', text: 'Help Message')
    find('Button').click
    expect(page).to have_content('Button')
    expect(page).to have_content('Help Message')
    expect(page).to have_selector('div.tooltip', text: 'Help Message')
  end

  it 'can have different direction' do
    matestack_render do
      bs_tooltip tooltip_title: "Help Message", placement: :top do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('span[data-bs-placement="top"]')
  end

  it 'can have custom HTML added' do
    matestack_render do
      bs_tooltip tooltip_title: "<em>Tooltip</em> <u>with</u> <b>HTML</b>", html: 'true' do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('span[data-bs-html="true"]')
    find('Button').hover
    expect(page).to have_content('Tooltip with HTML')
  end

  it 'can have a custom delay' do
    matestack_render do
      bs_tooltip tooltip_title: "Message", delay: 3000 do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('span[data-bs-delay="3000"]')
    expect(page).not_to have_content('Message')
    find('Button').hover
    expect(page).not_to have_content('Message')
    expect(page).to have_content('Message', wait: 3)
  end

  it 'can have an offset' do
    matestack_render do
      bs_tooltip tooltip_title: "Message", offset: 100 do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('span[data-bs-offset="100"]')
  end

  it 'can have different trigger' do
    matestack_render do
      bs_tooltip tooltip_title: "Message", trigger: 'hover focus' do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('span[data-bs-trigger="hover focus"]')
  end

  it 'doesnt have animation' do
    matestack_render do
      bs_tooltip tooltip_title: "Message", animation: 'false' do
        action method: :post, path: root_path do
          bs_btn text: "Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('span[data-bs-animation="false"]')
  end

end
