RSpec.describe 'Components::Nav' do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end
  
  it 'renders basic nav' do
    nav = matestack_component(:nav).show.to_s
    expected_nav = <<~HTML
    HTML
    expect(stripped(nav)).to eq(stripped(expected_nav))
  end