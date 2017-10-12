class Product < ActiveRecord::Base
    belongs_to :category
    belongs_to :sub_category
    has_one :wish_list
    has_many :reviews
    has_many :cart_line_items
    has_many :order_line_items
	validates_presence_of :name, :price, :category_id, :description
	validates_numericality_of :price, :category_id, greater_than_or_equal_to: 1
end
