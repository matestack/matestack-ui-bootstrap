class Dummy::ProductsController < Dummy::BaseController

  after_action :broadcast_activity_tracked, only: [:create, :update, :destroy]

  matestack_layout Dummy::Layout

  def index
    render Dummy::Pages::Products::Index
  end

  def new
    render Dummy::Pages::Products::New
  end

  def edit
    render Dummy::Pages::Products::Edit
  end

  def create
    product = Product.create(product_params)
    if product.errors.any?
      render json: { message: "Missing or invalid params", errors: product.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)

    if product.errors.any?
      render json: { message: "Missing or invalid params", errors: product.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  def destroy
    product = Product.find(params[:id])

    if product.destroy
      render json: { }, status: :ok
    else
      render json: { message: "Missing or invalid params", errors: product.errors }, status: :unprocessable_entity
    end
  end

  protected

  def product_params
    params.require(:product).permit(
      :name, :description, :price_in_euro
    )
  end

end
