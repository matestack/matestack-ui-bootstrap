class Dummy::CustomersController < Dummy::BaseController

  after_action :broadcast_activity_tracked, only: [:create, :update, :destroy]

  matestack_layout Dummy::Layout

  def index
    render Dummy::Pages::Customers::Index
  end

  def new
    render Dummy::Pages::Customers::New
  end

  def edit
    render Dummy::Pages::Customers::Edit
  end

  def create
    customer = Customer.create(customer_params)
    if customer.errors.any?
      render json: { message: "Missing or invalid params", errors: customer.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)

    if customer.errors.any?
      render json: { message: "Missing or invalid params", errors: customer.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :ok
    end
  end

  def destroy
    customer = Customer.find(params[:id])

    if customer.destroy
      render json: { }, status: :ok
    else
      render json: { message: "Missing or invalid params", errors: customer.errors }, status: :unprocessable_entity
    end
  end

  protected

  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :email, :street, :house_number, :postal_code, :city
    )
  end

end
