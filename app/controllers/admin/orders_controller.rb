class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    # @order = Order.find(params[:id])
    # @customer = @order.customer
    # @order_detail = OrderDetail.find(params[:id])
    # @items = @order_detail.item
    # @total = 0
    # @order.shipping_cost = 800
    # @order.total_payment = @total + @order.shipping_cost
    # @items.each do |item|
    #   @total += item.subtotal
    # end
    @order = Order.find(params[:id])
    @total = 0
  end

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.status == "paid"
      @order_details.each do |order_detail|
        order_detail.making_status = "not_yet_started"
        order_detail.save
      end
    end

    redirect_to admin_order_path(@order.id)
  end

  # def update
  #   @order = Order.find(params[:id])
  #   @order.update(order_params)
  #   redirect_to admin_order_path(@order.id)
  # end

  #ストロングパラメータ
  private

  def order_params
    params.require(:order).permit(:status)
  end
end
