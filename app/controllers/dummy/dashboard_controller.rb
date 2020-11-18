class Dummy::DashboardController < ApplicationController

  before_action :set_paper_trail_whodunnit
  before_action :authenticate_admin!
  after_action :broadcast_activity_tracked, only: [:create, :update, :destroy]

  matestack_app Dummy::App

  def show
    render Dummy::Pages::Dashboard::Show
  end

end
