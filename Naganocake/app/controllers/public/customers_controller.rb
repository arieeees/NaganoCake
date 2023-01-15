class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_my_page_path, notice: "変更の保存しました"
    else
      render :edit
    end
  end

  def unsubscribe_check
    @customer = Customer.find(current_customer.id)
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    session[:current_customer] = nil
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :customer_status)
  end
end
