class FormTestController < ActionController::Base
  before_action :check_params

  def check_params
    expect_params(params.permit!.to_h)
  end

  def expect_params(params)
  end

  def success_submit
    render json: {
      message: "server says: form submitted successfully"
    }, status: 200
  end

  def delayed_success_submit
    sleep 1
    render json: {
      message: "server says: form submitted successfully"
    }, status: 200
  end

  def failure_submit
    render json: {
      message: "server says: form was not submitted successfully",
      errors: {
        foo: ["can't be blank", "is invalid"]
      }
    }, status: 401
  end

end
