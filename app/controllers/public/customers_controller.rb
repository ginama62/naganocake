class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    # @customer = Customer.find(params[:id])
    @customer = current_customer
    # @customers = Customer.all
  end

  def edit
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集が完了しました"
      redirect_to public_customer_path(current_customer)
    else
      render :edit
    end
    # @customer = Customer.find(params[:id])
    # @customer.update(customer_params)
    # redirect_to public_customer_path(current_customer)
  end

  def unsubscribe
    @customer = current_customer

  def withdraw
     @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     flash[:notice] = "退会処理を実行いたしました"
     redirect_to root_path
  end
  end

  #投稿データのストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:email, :is_deleted)
  end

end
