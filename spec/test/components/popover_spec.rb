require 'rails_helper'

RSpec.describe "Bootstrap::Components::Pagination", type: :feature, js: true do
  include Utils

  it 'renders a default popover' do
    matestack_render { bs_popover }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-toggle="popover"]')
  end

  it 'has text and content' do
    matestack_render {
      bs_popover text: "Popover", content: "Pop Content"
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-toggle="popover"]')
    expect(page).to have_content('Popover')
    expect(page).not_to have_content('Pop Content')
    click_on('Popover')
    expect(page).to have_content('Pop Content')
  end

  it 'has different tag' do
    matestack_render {
      [:a, :span, :div].each do |type|
        bs_popover text: "Popover", content: "Pop Content", tag: type
      end
    }
    visit example_path
    expect(page).to have_selector('a[data-bs-toggle="popover"]')
    expect(page).to have_selector('div[data-bs-toggle="popover"]')
    expect(page).to have_selector('span[data-bs-toggle="popover"]')
  end

  it 'can popup in different direction' do
    matestack_render {
      [:top, :bottom, :left, :right].each do |direction|
        bs_popover text: "Popover", content: "Pop Content", placement: direction
      end
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-placement="top"]')
    expect(page).to have_selector('button.btn[data-bs-placement="bottom"]')
    expect(page).to have_selector('button.btn[data-bs-placement="left"]')
    expect(page).to have_selector('button.btn[data-bs-placement="right"]')
  end

  it 'can dismiss on next click' do
    matestack_render {
      bs_btn text: "Random Button"
      bs_popover text: "Popover", content: "Pop Content", trigger: :focus
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-trigger="focus"]')
    click_on('Popover')
    expect(page).to have_content('Pop Content')
    click_button('Random Button')
    expect(page).not_to have_content('Pop Content')
  end

  it 'has animation' do
    matestack_render {
      bs_popover text: "Popover", content: "Pop Content", animation: 'true'
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-animation="true"]')
  end

  it 'content has title' do
    matestack_render {
      bs_popover text: "Popover", content: "Pop Content", title: "Popover Title"
    }
    visit example_path
    expect(page).not_to have_content('Popover Title')
    click_on('Popover')
    expect(page).to have_content('Popover Title')
  end

  it 'can have different variant' do
    matestack_render {
      bs_popover text: "Popover", content: "Pop Content", variant: :secondary
    }
    visit example_path
    expect(page).to have_selector('.btn-secondary')
  end

  it 'can has a delay' do
    matestack_render {
      bs_popover text: "Popover", content: "Pop Content", delay: "3000"
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-delay="3000"]')
    click_on('Popover')
    expect(page).not_to have_content('Pop Content')
    expect(page).to have_content('Pop Content', wait: 5)
  end

  it 'can has html attributes' do
    matestack_render {
      bs_popover text: "Popover", html: 'true', content: "<p>this paragraph in popover</p>"
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-html="true"]')
    click_on('Popover')
    expect(page).to have_content('this paragraph in popover')
    expect(page).to have_selector('div.popover-body > p')
  end

  it 'can has an offset' do
    matestack_render {
      bs_popover text: "Popover", content: "Pop Content", offset: "20"
    }
    visit example_path
    expect(page).to have_selector('button.btn[data-bs-offset="20"]')
  end
end
