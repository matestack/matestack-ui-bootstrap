require 'rails_helper'

RSpec.describe "Bootstrap::Components::Tooltip", type: :feature, js: true do
  include Utils

  it 'tooltip is not shown on initial page load' do
    matestack_render do
      tooltip 
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-toggle="tooltip"]')
  end

  it 'appears with a button a text message' do
    matestack_render do
      tooltip text: "Button", title: "Help Message"
    end
    visit example_path
    expect(page).to have_content('Button')
    expect(page).to have_selector('button.btn.btn-primary[data-toggle="tooltip"]')
    find('Button').hover
    expect(page).to have_content('Help Message')
  end

  it 'can have different direction' do
    matestack_render do
      tooltip placement: :top
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-placement="top"]')
  end

  it 'can have custom HTML added' do
    matestack_render do
      tooltip text: "Button", title: "<em>Tooltip</em> <u>with</u> <b>HTML</b>", html: 'true'
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-html="true"]')
    find('Button').hover
    expect(page).to have_content('Tooltip with HTML')
  end

  it 'can have a custom delay' do
    matestack_render do
      tooltip text: "Button", title: "Message", delay: 3000
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-delay="3000"]')
    expect(page).not_to have_content('Message')
    find('Button').hover
    expect(page).not_to have_content('Message')
    expect(page).to have_content('Message', wait: 3)
  end

  it 'can have an offset' do
    matestack_render do
      tooltip text: "Button", title: "Message", offset: 100
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-offset="100"]')
  end

  it 'can have different trigger' do
    matestack_render do
      tooltip text: "Button", title: "Message", trigger: 'hover focus'
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-trigger="hover focus"]')
  end

  it 'doesnt have animation' do
    matestack_render do
      tooltip text: "Button", title: "Message", animation: 'false'
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary[data-animation="false"]')
  end
  
  it 'is type span' do
    matestack_render do
      tooltip type: :span
    end
    visit example_path
    expect(page).to have_selector('span[data-type="span"]')
  end

  it 'is type div' do
    matestack_render do
      tooltip type: :div
    end
    visit example_path
    expect(page).to have_selector('div[data-type="div"]')
  end

  it 'is type link' do
    matestack_render do
      tooltip type: :link
    end
    visit example_path
    expect(page).to have_selector('a.btn.btn-link[data-type="link"]')
  end

end