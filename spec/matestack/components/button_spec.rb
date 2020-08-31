RSpec.describe 'Components::Button' do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end
  
  it 'renders default primary button' do
    button = matestack_component(:btn).show.to_s
    # IMPORTANT use single qoutes ' instead of double qoutes " for html attributes
    expected_button = <<~HTML
      <button class='btn btn-primary' type='button'></button>
    HTML
    expect(stripped(button)).to eq(stripped(expected_button))
  end
  
  it 'accepts a size' do
    button = matestack_component(:btn, size: :md).show.to_s
    expected_button = <<~HTML
      <button class='btn btn-primary btn-md' type='button'></button>
    HTML
    expect(stripped(button)).to eq(stripped(expected_button))
  end

end