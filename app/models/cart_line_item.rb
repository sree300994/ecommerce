class CartLineItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	has_many :addresses

	validates_presence_of :user_id, :product_id, :quantity
	validates_numericality_of :user_id, :product_id
	validates_numericality_of :quantity, within:1..10

	# instance method / object method
	def save_or_update
		# binding.pry
		line_item = CartLineItem.find_by(user_id: self.user_id, product_id: self.product_id)
		# binding.pry
		if line_item.nil?
			self.save
			# binding.pry
		else
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
			# binding.pry
		end
		return true
	end

end
