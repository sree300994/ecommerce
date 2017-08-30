class ReviewsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

	def index
		@reviews = current_user.reviews
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		# binding.pry
		if @review.save
			Notification.review_confirmation(@review).deliver!
			redirect_to :back, notice: "Successfully created the Review"
		end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update_attributes(params[:review].permit(:product_id, :user_id, :body, :rating))
			redirect_to product_path, notice: "Successfully updated the review"
		else
			render action: "edit"
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to product_path, notice: "Successfully destroyed the product"
	end
	def review_params
		params.require(:review).permit(:product_id, :user_id, :body, :rating)
	end
end

