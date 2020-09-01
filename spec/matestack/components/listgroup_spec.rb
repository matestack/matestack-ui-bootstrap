RSpec.describe 'Components::Listgroup' do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end
  
  it 'renders basic listgroup' do
    listgroup = matestack_component(:listgroup).show.to_s
    expected_listgroup = <<~HTML

    HTML
    expect(stripped(listgroup)).to eq(stripped(expected_listgroup))
  end
end