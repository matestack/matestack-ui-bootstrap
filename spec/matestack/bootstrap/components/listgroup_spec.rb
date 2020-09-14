require 'rails_helper'

RSpec.describe 'Bootstrap::Components::Listgroup' do
  include Utils
  
  it 'renders basic listgroup' do
    listgroup = matestack_component(:listgroup, items: {
      first: {content: "Item1"},
      second: {content: "Item2"} }).show.to_s
    expected_listgroup = <<~HTML
    <ul class='list-group'>
      <li class='list-group-item'>Item1</li>
      <li class='list-group-item'>Item2</li>
    </ul>
    HTML
    expect(stripped(listgroup)).to eq(stripped(expected_listgroup))
  end

  it 'renders listgroup with button el' do
    listgroup = matestack_component(:listgroup, items: {
      first: {type: :button, content: "Button1"},
      second: {type: :button, content: "Button2"} }).show.to_s
    expected_listgroup = <<~HTML
    <ul class='list-group'>
      <button class='list-group-item list-group-item-action' type='button'>Button1</button>
      <button class='list-group-item list-group-item-action' type='button'>Button2</button>
    </ul>
    HTML
    expect(stripped(listgroup)).to eq(stripped(expected_listgroup))
  end
end