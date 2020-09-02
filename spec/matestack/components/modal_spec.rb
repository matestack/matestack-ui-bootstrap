RSpec.describe 'Components::Modal' do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end
  
  it 'renders basic modal' do
    modal = matestack_component(:modal, id: 'exampleModal', m_title: 'Modal Title', text: 'Modal Messages', close_btn_text: 'Close').show.to_s
    
    expected_modal = <<~HTML
    <div aria-hidden='true'  aria-labelledby='exampleModalLabel' class='modal fade' id='exampleModal' tabindex='-1'>
      <div class='modal-dialog'>
        <div class='modal-content'>
          <div class='modal-header'>
            <h5 class='modal-title'>Modal Title</h5>
            <button aria-label='Close' class='close' data-dismiss='modal' type='button'>
              <span aria-hidden='true'>&times;</span>
            </button>
          </div>
          <div class='modal-body'>
            Modal Messages
          </div>
          <div class='modal-footer'>
            <button class='btn btn-secondary' data-dismiss='modal' type='button'>Close</button>
          </div>
        </div>
      </div>
    </div>
    HTML
    byebug
    expect(stripped(modal)).to eq(stripped(expected_modal))  
    
  end
end