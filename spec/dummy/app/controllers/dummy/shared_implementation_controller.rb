class Dummy::SharedImplementationController < Dummy::BaseController

  matestack_layout Dummy::Layout

  def show
    render Dummy::Pages::SharedImplementation::Shpw
  end

end
