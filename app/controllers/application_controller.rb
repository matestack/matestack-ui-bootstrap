class ApplicationController < ActionController::Base
  
  include Matestack::Ui::Core::ApplicationHelper
  include Components::Registry

end
