require 'rails_helper'

RSpec.describe "Components::Navbar", type: :feature, js: true do
  include Utils

  it 'renders simple navbar' do
    matestack_render do
      navbar brand_text: "BRAND TEXT", brand_path: "#", theme: :light, sticky_top: true,
            items: { home: {type: :transition, path: "/", text: "Home"}, 
                    product: {type: :transition, path: "/", text: "Product"}, 
                    contact: {type: :transition, path: "/", text: "Contact"}, }
    end
    visit example_path
    expect(page).to have_content 'BRAND TEXT'
    expect(page).to have_selector('span.navbar-toggler-icon')
    expect(page).to have_selector('ul.nav.navbar.sticky-top.navbar-expand-lg.navbar-light.bg-light')
  end

  it 'renders navbar with yield custom component' do
    matestack_render do
      navbar brand_text: "BRAND TEXT", brand_path: "#", theme: :dark, items_class: "mr-auto ml-auto", class: "text-center",
      items: { home: {type: :transition, path: "/", text: "Home"}, 
              product: {type: :transition, path: "/", text: "Product"}, 
              contact: {type: :transition, path: "/", text: "Contact"}, } do
                btn text: "Login"
              end
    end
    visit example_path
    expect(page).to have_selector('span.navbar-toggler-icon')
    expect(page).to have_selector('ul.nav.navbar.navbar-expand-lg.navbar-dark.bg-dark.text-center')
    # TODO: Press Toggle Button to expand the menu and test elements within navbar-collapse
  end
end