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
      redirect_to public_customers_my_page_path, notice: "変更の保存しました"
    else
      render :edit
    end
  end

  def unsubscribe_check
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
    @customer.is_deleted = true
    @customer.save
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
end
