class Admins::SessionsController < Devise::SessionsController
  # include your component registry in order to use custom components
  include Matestack::Ui::Core::Helper

  # matestack_app Profile::App # specify the corresponding app to wrap pages in

  # override in order to render a page
  def new
    render Devise::Pages::SignIn
  end

end
