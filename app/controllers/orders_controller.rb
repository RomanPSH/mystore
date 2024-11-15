class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @order = Order.new
    @cart_items = current_user.cart.cart_items.includes(:product)
  end

  def create
    @order = current_user.orders.build(order_params)
    @cart_items = current_user.cart.cart_items.includes(:product)

    if @cart_items.empty?
      redirect_to cart_path, alert: "Ваш кошик порожній!"
      return
    end

    total_amount = @cart_items.sum { |item| item.product.cost * item.quantity }
    @order.total_amount = total_amount

    if @order.save
      @cart_items.each do |cart_item|
        @order.order_items.create!(
          product: cart_item.product,
          quantity: cart_item.quantity
        )
      end

      current_user.cart.cart_items.destroy_all

      redirect_to order_path(@order), notice: "Замовлення успішно створене."
    else
      render :new, alert: "Не вдалося створити замовлення. Перевірте введені дані."
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Це замовлення не знайдено або воно не належить вам."
  end

  private

  def order_params
    params.require(:order).permit(:delivery_method, :payment_method, :address, :phone)
  end
end
