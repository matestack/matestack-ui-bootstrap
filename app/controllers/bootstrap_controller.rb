class BootstrapController < ApplicationController
  include Matestack::Ui::Core::ApplicationHelper
  
  matestack_app Bootstrap::App

  def home
    render Bootstrap::Pages::Home
  end

  def form
    render Bootstrap::Pages::Forms
  end

  def test_form
    result = (key = params.to_unsafe_h.dig(:example, :key)) ? params[:example][key] : false
    render json: {
      errors: { "#{key || 'no key selected'}": ["#{key} is invalid"] }
    }, status: ((result.nil? || result == false || (result.is_a?(Array) && result.first.to_i == 0)) ? :unprocessable_entity : :ok)
  end

end