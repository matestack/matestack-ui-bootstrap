class Dummy::OrdersController < Dummy::BaseController

  after_action :broadcast_activity_tracked, only: [:create, :update, :destroy]

  matestack_layout Dummy::Layout

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

  def change_status_by_drag_and_drop
    order = Order.find(drop_params[:draggable_id])

    saved = true
    
    if order.status != drop_params[:status]
      saved = order.update(status: drop_params[:status])
    end

    if saved && drop_params[:position].present?
      saved = order.insert_at(drop_params[:position])
    end

    if saved
      render json: {
        message: 'Order was successfully moved.'
      }, status: :ok
    else
      render json: {
        errors: order.errors,
        message: 'Order could not be moved.'
      }, status: :unprocessable_entity
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

  def drop_params
    params.permit(:draggable_id, :status, :position)
  end

end
