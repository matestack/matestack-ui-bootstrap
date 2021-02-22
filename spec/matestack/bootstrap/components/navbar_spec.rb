require 'rails_helper'

RSpec.describe "Bootstrap::Components::Navbar", type: :feature, js: true do
  include Utils

  it 'rendes basic navbar' do
    matestack_render do
      bs_navbar
    end
    visit example_path
    expect(page).to have_selector('nav.navbar', visible: false)
  end

  it 'has brand elements' do
    matestack_render do
      bs_navbar brand: {text: "BRAND TEXT", path: "#"}
    end
    visit example_path
    expect(page).to have_selector('.navbar-brand')
  end

  it 'can have custom toggle class' do
    matestack_render do
      bs_navbar brand: "BRAND HERE", toggle: { position: :left, class: "foobar" }
    end
    visit example_path
    expect(page).to have_selector('.foobar')
  end

  it 'can have custom theme' do
    matestack_render do
      bs_navbar brand: "BRAND HERE", theme: :dark
    end
    visit example_path
    expect(page).to have_selector('.navbar-dark.bg-dark')
  end

  it 'can have different background color' do
    matestack_render do
      bs_navbar brand: "BRAND HERE", theme: :dark, color: :primary
    end
    visit example_path
    expect(page).to have_selector('.navbar-dark.bg-primary')
  end

  it 'has multiple items' do
    matestack_render do
      bs_navbar hide_at: :sm, items: [
                          { type: :transition, path: "/", text: "Home" },
                          { type: :transition, path: "#", text: "Contact" } ]
    end
    visit example_path
    expect(page).to have_selector('nav.navbar.navbar-expand-sm')
    expect(page).to have_selector('li.nav-item > a.nav-link', count: 2)
    expect(page).to have_content('Home')
    expect(page).to have_content('Contact')
  end

  it 'renders navbar with yield custom classes and custom component' do
    matestack_render do
      bs_navbar hide_at: :sm, items_class: "foobar", class: "text-center",
      items: [
        { type: :transition, path: "/", text: "Home" },
        { type: :transition, path: "#", text: "Contact" } ] do
                bs_btn text: "Login"
              end
    end
    visit example_path
    expect(page).to have_selector('nav.navbar.navbar-expand-sm.text-center')
    expect(page).to have_selector('ul.navbar-nav.foobar > li.nav-item')
    expect(page).to have_content('Login')
  end

  it 'can have fixed top, fixed bottom or sticky top' do
    matestack_render do
      bs_navbar fixed_top: true
      bs_navbar fixed_bottom: true
      bs_navbar sticky_top: true
    end
    visit example_path
    expect(page).to have_selector('nav.navbar.fixed-top')
    expect(page).to have_selector('nav.navbar.fixed-bottom')
    expect(page).to have_selector('nav.navbar.sticky-top')
  end

  it 'can have different container sizes' do
    matestack_render do
      bs_navbar container_size: :lg
    end
    visit example_path
    expect(page).to have_selector('nav > div.container-lg')
  end

  it 'can collapse and expand' do
    matestack_render do
      bs_navbar toggle: :left, items: [
        { type: :transition, path: "/", text: "Home" },
        { type: :transition, path: "#", text: "Contact" } ]
    end
    visit example_path
    expect(page).not_to have_selector('.collapse.navbar-collapse')
    expect(page).not_to have_content('Home')
    click_button
    expect(page).to have_selector('.collapse.navbar-collapse')
    expect(page).to have_content('Home')
    click_button
    expect(page).not_to have_selector('.collapse.navbar-collapse')
    expect(page).not_to have_content('Home')
  end
end
