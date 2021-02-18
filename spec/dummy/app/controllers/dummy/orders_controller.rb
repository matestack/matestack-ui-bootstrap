class Dummy::OrdersController < Dummy::BaseController

  after_action :broadcast_activity_tracked, only: [:create, :update, :destroy]

  matestack_app Dummy::App

  def index
    render Dummy::Pages::Orders::Index
  end

  def new
    render Dummy::Pages::Orders::New
  end

  def edit
    render Dummy::Pages::Orders::Edit
  end

  def create
    order = Order.create(order_params)
    if order.errors.any?
      render json: { message: "Missing or invalid params", errors: order.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)

    if order.errors.any?
      render json: { message: "Missing or invalid params", errors: order.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  def destroy
    order = Order.find(params[:id])

    if order.destroy
      render json: { }, status: :ok
    else
      render json: { message: "Missing or invalid params", errors: order.errors }, status: :unprocessable_entity
    end
  end

  protected

  def order_params
    params.require(:order).permit(
      :shipped_at
    )
  end

end
