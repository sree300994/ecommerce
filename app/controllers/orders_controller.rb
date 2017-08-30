class OrdersController < ApplicationController

	before_action :authenticate_user!
	def index
		# Order.where('user_id = ?', current_user.id)
		@orders = current_user.orders
	end

	def create 
		@order = Order.new(params[:order].permit(:address_id))
		@order.order_date = Date.today 
		@order.user_id	= current_user.id
		@order.order_number = "DCT#{Random.rand(1000)}"
		@order.save
		Notification.order_notification(@order).deliver!
		redirect_to orders_path, notice: "Your order has been placed"
	end
end
