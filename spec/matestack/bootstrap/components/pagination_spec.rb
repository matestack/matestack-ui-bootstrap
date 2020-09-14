require 'rails_helper'

RSpec.describe "Bootstrap::Components::Pagination", type: :feature, js: true do
  include Utils

  it 'renders basic pagination' do
    matestack_render do
      pagination class: "justify-content-center", items: { "1": "#", "2": "#", "3": "#" }, size: :sm
    end
    visit example_path
    expect(page).to have_selector('ul.nav.justify-content-center')
    expect(page).to have_selector('ul.pagination')
  end
end