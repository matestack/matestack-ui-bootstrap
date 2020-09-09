require 'rails_helper'

describe 'Components::Card', type: :feature, js: true do
  include Utils

  it 'renders card' do
    matestack_render do
      card text: "Some quick example text to build on the card title and make up the bulk of the card's content.",
            title: "Card title", header_text: "Card Header", hide_footer: true do
        div class: "p-3" do
          btn text: "Card Button"
          btn text: "Another Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.card-header')
    expect(page).to have_selector('div.card-body')
    expect(page).not_to have_selector('div.card-footer')
  end

  it 'renders card with slots option' do
    matestack_render do
      card img_path: image_url("matestack-data.png"), text: "Some quick example text to build on the card title and make up the bulk of the card's content.",
              slots: { body: slot {
                ul class: 'list-group list-group-flush' do
                  li class: "list-group-item" do plain "Item 1" end
                  li class: "list-group-item" do plain "Item 2" end
                end
                link class: 'btn btn-link', text: "Card link", path: "#"
                link class: 'btn btn-link', text: "Another link", path: "#"
              } }, hide_footer: true, hide_header: true do
                plain "Yield Content"
          end
    end
    visit example_path
    expect(page).to have_selector('li.list-group-item')
    expect(page).to have_selector('div.card-body')
    expect(page).not_to have_selector('div.card-header')
    expect(page).not_to have_selector('div.card-footer')
  end

end