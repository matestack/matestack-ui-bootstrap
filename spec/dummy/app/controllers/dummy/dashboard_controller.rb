class Dummy::DashboardController < Dummy::BaseController

  matestack_layout Dummy::Layout

  def show
    render Dummy::Pages::Dashboard::Show
  end

end
