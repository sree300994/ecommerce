class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates_presence_of :product_id, :user_id, :body, :rating
	validates_numericality_of :rating
end
