class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.is_active == "payment_confirmation"
        @order.order_detail.update(production_status: "waiting_for_production")
      end
    redirect_back(fallback_location: root_path)
    end
  end

  private
  def order_params
    params.require(:order).permit(:is_active)
  end
end
