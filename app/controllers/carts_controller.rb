class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
  end

  def add
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_by(product: product)
  
    if cart_item
      cart_item.quantity += 1
    else
      cart_item = @cart.cart_items.build(product: product, quantity: 1)
    end
  
    if cart_item.save
      redirect_to products_path, notice: "#{product.title} додано до корзини."
    else
      redirect_to products_path, alert: "Не вдалося додати товар до корзини."
    end
    
  end

  def remove
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_by(product: product)
    if cart_item
      cart_item.destroy
      redirect_to cart_path, notice: "#{product.title} видалено з корзини."
    else
      redirect_to cart_path, alert: "Товар не знайдено в корзині."
    end
  end

  def increase_quantity
    cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    if cart_item
      cart_item.increment!(:quantity)
      redirect_to cart_path, notice: "Кількість товару збільшено."
    else
      redirect_to cart_path, alert: "Товар не знайдено в корзині."
    end
  end
  
  def decrease_quantity
    cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    
    if cart_item
      if cart_item.quantity > 1
        cart_item.decrement!(:quantity)
        redirect_to cart_path, notice: "Кількість товару зменшено."
      else
        redirect_to cart_path, notice: "Кількість товару не може бути меншою за 1."
      end
    else
      redirect_to cart_path, alert: "Товар не знайдено в корзині."
    end
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
