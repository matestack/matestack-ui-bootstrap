class ApplicationController < ActionController::Base

  include Matestack::Ui::Core::ApplicationHelper
  include Bootstrap::Registry

  include Dummy::Components::Registry

  def user_for_paper_trail
    admin_signed_in? ? current_admin.id : nil  # or whatever
  end

  def broadcast_activity_tracked
    ActionCable.server.broadcast('matestack_ui_core', {
      event: 'activity-tracked'
    })
  end

end
