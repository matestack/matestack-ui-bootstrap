RSpec.describe "Components::Toasts" do
  include Matestack::Ui::Core::ApplicationHelper
  include Utils

  class Matestack::Ui::Core::Component::Base
    include Components::Registry
  end

  it 'renders basic toasts' do
    toasts = matestack_component(:toast, t_title: "Bootstrap", t_text: "11 mins ago", message: "Hello, world! This is a toast message.").show.to_s
    expected_toasts = <<~HTML
      <div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>
        <div class='toast-header'>
          <strong class='mr-auto'>Bootstrap</strong>
          <small>11 mins ago</small>
          <button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>
            <span aria-hidden='true'>&times;</span>
          </button>
      </div>
      <div class='toast-body'>
        Hello, world! This is a toast message.
      </div>
    </div>
    HTML
  end

  # TODO: Test for show method & delay timeout
end
