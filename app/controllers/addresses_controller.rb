class AddressesController < ApplicationController

	def index
		@addresses = current_user.addresses
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(params[:address].permit(:user_id, :street, :pin, :city, :landmark))
		@address.user_id = current_user.id
		if @address.save
			redirect_to addresses_path, notice: "Successfully created the new Address"
		else
			render action: "new"
		end
	end

	def show
		@address = Address.find(params[:id])
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update_attributes(params[:address].permit(:user_id, :street, :pin, :city, :landmark))
			redirect_to addresses_path, notice: "Successfully updated the address"
		else
			render action: "edit"
		end
	end

	def destroy
		@address = Address.find(params[:id])
		@addess.destroy
		redirect_to addresses_path, notice: "Successfully deleted the address"
	end

end
