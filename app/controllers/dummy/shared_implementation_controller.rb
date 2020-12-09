class Dummy::SharedImplementationController < Dummy::BaseController

  matestack_app Dummy::App

  def show
    render Dummy::Pages::SharedImplementation::Shpw
  end

end
