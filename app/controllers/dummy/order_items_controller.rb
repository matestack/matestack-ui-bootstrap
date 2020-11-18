class Dummy::OrderItemsController < ApplicationController

  before_action :set_paper_trail_whodunnit
  before_action :authenticate_admin!
  after_action :broadcast_activity_tracked, only: [:create, :update, :destroy]

  def destroy
    order_item = OrderItem.find(params[:id])

    if order_item.destroy
      render json: { }, status: :ok
    else
      render json: { message: "Missing or invalid params", errors: order_item.errors }, status: :unprocessable_entity
    end
  end

end
