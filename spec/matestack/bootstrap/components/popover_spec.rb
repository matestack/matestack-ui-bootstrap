require 'rails_helper'

RSpec.describe "Bootstrap::Components::Pagination", type: :feature, js: true do
  include Utils

  it 'renders a default popover' do
    matestack_render { popover }
    visit example_path
    expect(page).to have_selector('button.btn[data-toggle="popover"]')
  end
  
  it 'has text and content' do
    matestack_render { 
      popover text: "Popover", content: "Pop Content" 
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-toggle="popover"]')
    expect(page).to have_content('Popover')
    expect(page).not_to have_content('Pop Content')
    click_on('Popover')
    expect(page).to have_content('Pop Content')
  end
  
  it 'has different tag' do
    matestack_render { 
      [:link, :span, :div].each do |type| 
        popover text: "Popover", content: "Pop Content", tag: type 
      end
    }
    visit example_path
    expect(page).to have_selector('a[data-toggle="popover"]')
    expect(page).to have_selector('div[data-toggle="popover"]')
    expect(page).to have_selector('span[data-toggle="popover"]')
  end
  
  it 'can popup in different direction' do
    matestack_render { 
      [:top, :bottom, :left, :right].each do |direction| 
        popover text: "Popover", content: "Pop Content", placement: direction
      end
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-placement="top"]')
    expect(page).to have_selector('button.btn[data-placement="bottom"]')
    expect(page).to have_selector('button.btn[data-placement="left"]')
    expect(page).to have_selector('button.btn[data-placement="right"]')
  end

  it 'can dismiss on next click' do
    matestack_render { 
      btn text: "Random Button"
      popover text: "Popover", content: "Pop Content", trigger: :focus
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-trigger="focus"]')
    click_on('Popover')
    expect(page).to have_content('Pop Content')
    click_button('Random Button')
    expect(page).not_to have_content('Pop Content')
  end

  it 'has animation' do
    matestack_render { 
      popover text: "Popover", content: "Pop Content", animation: 'true'
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-animation="true"]')
  end

  it 'content has title' do
    matestack_render { 
      popover text: "Popover", content: "Pop Content", title: "Popover Title"
    }
    visit example_path
    expect(page).not_to have_content('Popover Title')
    click_on('Popover')
    expect(page).to have_content('Popover Title')
  end

  it 'can have different variant' do
    matestack_render { 
      popover text: "Popover", content: "Pop Content", variant: :secondary
    }
    visit example_path
    expect(page).to have_selector('.btn-secondary')
  end

  it 'can has a delay' do
    matestack_render { 
      popover text: "Popover", content: "Pop Content", delay: "3000"
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-delay="3000"]')
    click_on('Popover')
    expect(page).not_to have_content('Pop Content')
    expect(page).to have_content('Pop Content', wait: 5)
  end
  
  it 'can has html attributes' do
    matestack_render { 
      popover text: "Popover", html: 'true', content: "<p>this paragraph in popover</p>" 
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-html="true"]')
    click_on('Popover')
    expect(page).to have_content('this paragraph in popover') 
    expect(page).to have_selector('div.popover-body > p')
  end

  it 'can has an offset' do
    matestack_render { 
      popover text: "Popover", content: "Pop Content", offset: "20"
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-offset="20"]')
  end
end