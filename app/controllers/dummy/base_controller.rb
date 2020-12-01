class Dummy::BaseController < ApplicationController

  include Matestack::Ui::Core::ApplicationHelper
  include Dummy::Components::Registry

  before_action :set_paper_trail_whodunnit

  before_action :authenticate_admin!

  def user_for_paper_trail
    admin_signed_in? ? current_admin.id : nil
  end

  def broadcast_activity_tracked
    ActionCable.server.broadcast('matestack_ui_core', {
      event: 'activity-tracked'
    })
  end

end
