require 'rails_helper'

RSpec.describe "Bootstrap::Components::Nav", type: :feature, js: true do
  include Utils

  it 'renders basic navigation' do
    matestack_render do
      navigation
    end
    visit example_path
    expect(page).to have_selector('ul.nav', visible: false)
  end

  it 'has basic transition' do
    matestack_render do
      navigation items: {
        home: { path: "#home", text: "Home" },
        team: { path: "#messages", text: "Message" }
      } 
    end
    visit example_path
    expect(page).to have_selector('ul.nav > li.nav-item > a.nav-link')
    expect(page).to have_content('Home')
    expect(page).to have_content('Message')
  end
  
  it 'has basic link element' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        team: { type: :link, path: "#messages", text: "Message" }
      } 
    end
    visit example_path
    expect(page).to have_selector('ul.nav > li.nav-item > a.nav-link')
    expect(page).to have_content('Home')
    expect(page).to have_content('Message')
  end

  it 'can align horizontally' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        team: { type: :link, path: "#messages", text: "Message" }
      }, horizontal: :center
    end
    visit example_path
    expect(page).to have_selector('ul.nav.justify-content-center > li.nav-item > a.nav-link')
  end

  it 'can stack vertically' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        team: { type: :link, path: "#messages", text: "Message" }
      }, vertical: true
    end
    visit example_path
    expect(page).to have_selector('ul.nav.flex-column > li.nav-item > a.nav-link')
  end

  it 'has elements with equals width' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        team: { type: :link, path: "#messages", text: "Message" }
      }, justified: true
    end
    visit example_path
    expect(page).to have_selector('ul.nav.nav-justified > li.nav-item > a.nav-link')
  end

  it 'has elements that proportionately fill all available space' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        team: { type: :link, path: "#messages", text: "Message" }
      }, fill: true
    end
    visit example_path
    expect(page).to have_selector('ul.nav.nav-fill > li.nav-item > a.nav-link')
  end

  it 'renders navigation with tabs' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        product: { type: :link, path: "#profile", text: "Profile" },
      }, tabs: true
      div class: "tab-content" do
        div class: "tab-pane active", id: "home", attributes: { role: "tabpanel", 'aria-labelledby':  "home-tab" } do
          plain "Content Tab Home"
        end
        div class: "tab-pane", id: "profile", attributes: { role: "tabpanel", 'aria-labelledby': "profile-tab" } do
          plain "Content Tab Profile"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.nav-tabs')
    expect(page).to have_selector('div.tab-content > div.tab-pane')
    expect(page).to have_content 'Content Tab Home'
    expect(page).not_to have_content('Content Tab Profile')
    click_on('Profile')
    expect(page).to have_content('Content Tab Profile')
  end
  
  it 'renders navigation pills' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        team: { type: :link, path: "#messages", text: "Message" },
      }, pills: true
    end
    visit example_path
    expect(page).to have_content 'Message'
    expect(page).to have_selector('ul.nav.nav-pills')
  end

  it 'can have custom class' do
    matestack_render do
      navigation class: "foobar"
    end
    visit example_path
    expect(page).to have_selector('ul.nav.foobar', visible: false)
  end

end