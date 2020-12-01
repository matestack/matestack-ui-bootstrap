class Dummy::OrderItemsController < Dummy::BaseController

  after_action :broadcast_activity_tracked, only: [:destroy]

  def destroy
    order_item = OrderItem.find(params[:id])

    if order_item.destroy
      render json: { }, status: :ok
    else
      render json: { message: "Missing or invalid params", errors: order_item.errors }, status: :unprocessable_entity
    end
  end

end
