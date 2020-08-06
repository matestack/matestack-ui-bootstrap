class BootstrapController < ApplicationController
  include Matestack::Ui::Core::ApplicationHelper
  
  matestack_app Bootstrap::App

  def home
    render Bootstrap::Pages::Home
  end

end