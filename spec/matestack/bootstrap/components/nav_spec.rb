require 'rails_helper'

RSpec.describe "Bootstrap::Components::Nav", type: :feature, js: true do
  include Utils

  it 'renders navigation tabs' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        product: { type: :link, path: "#profile", text: "Profile" },
        team: { type: :link, path: "#messages", text: "Message" },
      }, horizontal: :center, tabs: true
      div class: "tab-content" do
        div class: "tab-pane active", id: "home", attributes: { role: "tabpanel", 'aria-labelledby':  "home-tab" } do
          plain "Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat."
        end
        div class: "tab-pane", id: "profile", attributes: { role: "tabpanel", 'aria-labelledby': "profile-tab" } do
          plain "..........ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat."
        end
        div class: "tab-pane", id: "messages", attributes: {  role: "tabpanel", 'aria-labelledby': "messages-tab" } do
          plain "do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat."
        end
      end
    end
    visit example_path
    expect(page).to have_content 'Home'
    expect(page).to have_selector('ul.nav.nav-tabs.justify-content-center')
    expect(page).to have_selector('div.tab-content')
  end
  
  it 'renders navigation pills vertical' do
    matestack_render do
      navigation items: {
        home: { type: :link, path: "#home", text: "Home" },
        product: { type: :link, path: "#profile", text: "Profile" },
        team: { type: :link, path: "#messages", text: "Message" },
      }, pills: true, vertical: true
    end
    visit example_path
    expect(page).to have_content 'Home'
    expect(page).to have_selector('ul.nav.nav-pills.flex-column')
  end

end