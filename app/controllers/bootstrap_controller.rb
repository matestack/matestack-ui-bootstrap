class BootstrapController < ApplicationController
  include Matestack::Ui::Core::ApplicationHelper

  matestack_app Bootstrap::App

  def home
    render Bootstrap::Pages::Home
  end

  def form
    render Bootstrap::Pages::Forms
  end

  def collection
    render Bootstrap::Pages::Collection
  end

  def test
    render Bootstrap::Pages::Test
  end

  def dashboard
    render Bootstrap::Pages::Dashboard
  end

  def test_form
    sleep 1
    errors = {}
    [
      :some_input_1,
      :some_input_2,
      :some_select_input,
      :some_multi_select_input,
      :some_single_checkbox_input,
      :some_multi_checkbox_input_1,
      :some_multi_checkbox_input_2,
      :some_radio_input_1,
      :some_radio_input_2,
      :some_single_switch_input,
      :some_multi_switch_input_1,
      :some_multi_switch_input_2,
      :some_single_file_input
    ].each do |key|
      errors[key] = ["can't be blank", "other error"] if test_form_params[key].blank?
    end
    if errors.any?
      render json: { errors: errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  protected

  def test_form_params
    params.require(:wrapper).permit(
      :some_input_1,
      :some_input_2,
      :some_select_input,
      :some_single_checkbox_input,
      :some_radio_input_1,
      :some_radio_input_2,
      :some_single_switch_input,
      :some_single_file_input,
      some_multi_select_input: [],
      some_multi_checkbox_input_1: [],
      some_multi_checkbox_input_2: [],
      some_multi_switch_input_1: [],
      some_multi_switch_input_2: []
    )
  end

end
