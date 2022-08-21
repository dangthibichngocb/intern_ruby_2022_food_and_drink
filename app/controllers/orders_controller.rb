class OrdersController < ApplicationController
  layout "dashboard"
  # before_action :logged_in_user

  def index; end

  def new
    @cart = @current_cart
    if @cart.line_items.empty?
      redirect_to dashboard_path, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderReceivedMailer.order_received(@order).deliver
    else
      render :new
    end
  end
end
