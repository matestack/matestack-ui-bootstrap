require 'rails_helper'

RSpec.describe "Bootstrap::Content::Table", type: :feature, js: true do
  include Utils

  it 'create blank table' do
    matestack_render do
      smart_table 
    end
    visit example_path
    expect(page).to have_selector('table')
  end

  it 'appears with content' do
    matestack_render do
      smart_table base_query: Person.all
    end
    visit example_path
      expect(page).to have_content('Mark')  
  end
end