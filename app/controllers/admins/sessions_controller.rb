class Admins::SessionsController < Devise::SessionsController
  # include your component registry in order to use custom components
  include Bootstrap::Registry

  # matestack_app Profile::App # specify the corresponding app to wrap pages in

  # override in order to render a page
  def new
    render Bootstrap::Pages::Devise::SignIn
  end

end
