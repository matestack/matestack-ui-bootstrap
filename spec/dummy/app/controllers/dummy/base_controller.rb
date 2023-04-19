class Dummy::BaseController < ApplicationController

  include Dummy::Components::Registry

  before_action :set_paper_trail_whodunnit

  before_action :authenticate_admin!

  def user_for_paper_trail
    admin_signed_in? ? current_admin.id : nil
  end

  def broadcast_activity_tracked
    ActionCable.server.broadcast('matestack_ui_vue_js', {
      event: 'activity-tracked'
    })
  end

end
