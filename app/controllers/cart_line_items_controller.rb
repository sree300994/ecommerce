class CartLineItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@cart_line_items = current_user.cart_line_items
		@wish_list = WishList.new
		@order = Order.new
	end

	def create
		# creates a CartLineItem for particular user to instance variable and permits a hash which name is cart_line_item and also permits some keys from that hash to instance variable
		@cart_line_item = CartLineItem.new(params[:cart_line_item].permit(:quantity, :product_id))
		# links up the current_user id to instance variable user id
		@cart_line_item.user_id = current_user.id
		# if the cart_line_item gets saved then it redirects the page to back and inform us that product is successfully added
		if @cart_line_item.save_or_update
			redirect_to cart_line_items_path, notice: "Successfully added product to the cart"
		end
	end

	def destroy
		@cart_line_item = CartLineItem.find(params[:id])
		@cart_line_item.destroy
		redirect_to cart_line_items_path, notice: "Successfully removed from the CartLineItem"
	end

	def update
		@cart_line_item = CartLineItem.find(params[:id])
		if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))
			redirect_to cart_line_items_path, notice: "Successfully updated the quantity of the product"
		end
	end
end
