class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
end

#   def show
#     @order = Order.find(params[:id])
#     @total = 0
#   end

#   def index
#     @customer = Customer.find(params[:id])
#     @orders = @customer.orders.page(params[:page])
#   end

#   def update
#     @order = Order.find(params[:id])
#     @order.update(order_params)
#     @order_details = @order.order_details

#     if @order.status == "paid"
#       @order_details.each do |order_detail|
#         order_detail.making_status = "not_yet_started"
#         order_detail.save
#       end
#     end

#     redirect_to admin_order_path(@order.id)
#   end

#   private

#   def order_params
#     params.require(:order).permit(:status)
#   end
# end