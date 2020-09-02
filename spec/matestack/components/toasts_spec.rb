RSpec.describe "Components::Toasts" do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end

  it 'renders basic toasts' do
    toasts = matestack_component(:toast, 
      t_title: "Bootstrap", t_text: "11 mins ago", 
      message: "Hello, world! This is a toast message."
    ).show.to_s
    expected_toasts = <<~HTML
      <div aria-atomic='true' aria-live='assertive' class='toast' role='alert'>
        <div class='toast-header'>
          <strong class='mr-auto'>Bootstrap</strong>
          <small>11 mins ago</small>
          <button aria-label='Close' class='ml-2 mb-1 close' data-dismiss='toast' type='button'>
            <span aria-hidden='true'>&times;</span>
          </button>
        </div>
        <div class='toast-body'>
          <p>
            Hello, world! This is a toast message.
          </p>
        </div>
      </div>
    HTML
    byebug
    expect(stripped(toasts)).to eq(stripped(expected_toasts))
  end

  # TODO: Test for show method & delay timeout
end
