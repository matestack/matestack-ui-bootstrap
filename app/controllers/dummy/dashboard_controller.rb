class Dummy::DashboardController < Dummy::BaseController

  matestack_app Dummy::App

  def show
    render Dummy::Pages::Dashboard::Show
  end

end
