RSpec.describe 'Components::Modal' do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end
  
  it 'renders basic modal' do
    modal = 
    expected_modal = <<~HTML

    HTML
    expect(stripped(modal)).to eq(stripped(expected_modal))
  end
end