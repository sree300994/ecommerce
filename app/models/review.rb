class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates_presence_of :body, :rating
	validates_numericality_of :rating
end
