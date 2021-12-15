class Api::V1::SubscriptionOrderController < ApplicationController
  before_action :find_user, only: :create

  def create
    if @user.present?
      @order = @user.order.build(order_subscription_params)
    else
      @order = Order.new(order_subscription_params)

    end
    if @order.save
      render json: { status: 'SUCCESS!', message: 'order subscription salvo!', data: @order }, status: :ok
    else
      render json: { status: 'ERROR!', message: 'order subscription não salvo!', data: @order.errors }, status: :unprocessable_entity
    end
  end

  def find_user
    @user = User.find_by_cpf(params[:order][:user_attributes][:cpf])
  end

  private
  def order_subscription_params
    params.require(:order).permit(:device_model, :device_imei, :annual_price, :payment_installments, user_attributes: [:name, :cpf, :email])
  end

end
