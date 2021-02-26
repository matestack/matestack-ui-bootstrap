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

  it 'can have pure text brand element' do
    matestack_render do
      bs_navbar brand: "BRAND TEXT"
    end
    visit example_path
    expect(page).to have_selector('.navbar-brand', text: "BRAND TEXT")
  end

  it 'can have brand transition element' do
    pending # check for correct transition behavior
    matestack_render do
      bs_navbar brand: { text: "BRAND TEXT", path: "/" }
    end
    visit example_path
    expect(page).to have_selector('.navbar-brand > a', text: "BRAND TEXT")
  end

  it 'can have brand link element' do
    pending # check for correct link behavior
    matestack_render do
      bs_navbar brand: { text: "BRAND TEXT", path: "/", type: :link }
    end
    visit example_path
    expect(page).to have_selector('.navbar-brand > a', text: "BRAND TEXT")
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

  it 'accepts multiple types for items' do
    pending # test correct transition, link, action behavior
    matestack_render do
      bs_navbar items: [
        { path: "/", text: "Home 1" },
        { type: :transition, path: "/", text: "Home 2" },
        { type: :link, path: "#", text: "Contact" },
        { type: :action, method: :delete, path: "/logout", text: "Logout" }
      ]
    end
    visit example_path
    expect(page).to have_selector('nav.navbar')
    expect(page).to have_selector('li.nav-item > a.nav-link', count: 4)
    expect(page).to have_content('Home 1')
    expect(page).to have_content('Home 2')
    expect(page).to have_content('Contact')
    expect(page).to have_content('Logout')
  end

  it 'renders navbar with yield custom classes and custom component' do
    matestack_render do
      bs_navbar expand_at: :sm, items_class: "foobar", class: "text-center",
      items: [
        { path: "/", text: "Home" },
        { path: "/", text: "Contact" }
      ] do
        bs_btn text: "Login"
      end
    end
    visit example_path
    expect(page).to have_selector('nav.navbar.navbar-expand-sm.text-center')
    expect(page).to have_selector('ul.navbar-nav.foobar > li.nav-item')
    expect(page).to have_content('Login')
  end

  it 'expands navbar at given breakpoint' do
    matestack_render do
      bs_navbar expand_at: :sm, items: [
        { type: :transition, path: "/", text: "Home" },
        { type: :transition, path: "#", text: "Contact" }
      ] do
        bs_btn text: "Login"
      end
    end
    visit example_path
    expect(page).to have_selector('nav.navbar.navbar-expand-sm')
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
      bs_navbar toggle: :left, theme: :dark, items: [
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
