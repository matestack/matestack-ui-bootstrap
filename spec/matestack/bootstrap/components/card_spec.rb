require 'rails_helper'

describe 'Bootstrap::Components::Card', type: :feature, js: true do
  include Utils

  it 'has title and body text' do
    matestack_render do
      bs_card title: "Card title", body: "Some quick example text"
    end
    visit example_path
    expect(page).to have_selector('div.card-body')
    expect(page).to have_content'Some quick example text'
  end

  it 'has a card header and card footer' do
    matestack_render do
      bs_card title: "Card title", body: "Some quick example text",
      header: "Card header", footer: "card footer"
    end
    visit example_path
    expect(page).to have_selector('div.card-header')
    expect(page).to have_selector('div.card-footer')
    expect(page).to have_content'Card header'
    expect(page).to have_content'card footer'
  end

  it 'has a custom header and footer implemented with slots option' do
    matestack_render do
      bs_card slots: {
            header: slot {
              bs_btn text: "Title Button"
            },
            footer: slot {
              paragraph class: "text-center", text: "2 days ago"
            } }
    end
    visit example_path
    expect(page).to have_selector('div.card-header')
    expect(page).not_to have_selector('div.card-body')
    expect(page).to have_selector('button.btn.btn-primary')
    expect(page).to have_selector('div.card-footer')
    expect(page).to have_selector('p.text-center')
    expect(page).to have_content('2 days ago')
  end

  it 'has an image above the body text' do
    matestack_render do
      bs_card title: "Card title", body: "Some quick example text",
            img_path: image_url("matestack-data.png")
    end
    visit example_path
    expect(page).to have_selector('img.card-img-top')
    expect(page).to have_selector("img[src*='matestack-data']")
  end

  it 'has only custom body component' do
    matestack_render do
      bs_card title: "Card title", body: "Some quick example text" do
        div class: "p-3" do
          bs_btn text: "Card Button"
          bs_btn text: "Another Button"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('div.card-body')
    expect(page).to have_selector('button.btn[type=button]')
    expect(page).to have_content('Card Button')
    expect(page).not_to have_selector('div.card-header')
    expect(page).not_to have_selector('div.card-footer')
  end

  it 'has a custom body implemented with slots option' do
    matestack_render do
      bs_card slots: {
            body: slot {
              ul class: 'list-group list-group-flush' do
                li class: "list-group-item" do plain "Item 1" end
                li class: "list-group-item" do plain "Item 2" end
              end
              link class: 'btn btn-link', text: "Card link", path: "#"
              link class: 'btn btn-link', text: "Another link", path: "#"
            }}
    end
    visit example_path
    expect(page).to have_selector('div.card-body')
    expect(page).to have_selector('ul.list-group.list-group-flush')
    expect(page).to have_selector('li.list-group-item')
    expect(page).to have_selector('a.btn.btn-link')
    expect(page).to have_content('Card link')
  end

end
