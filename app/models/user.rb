class User < ActiveRecord::Base
	has_many :cart_line_items
	has_many :reviews
	has_many :wish_lists
	has_many :orders
	has_many :addresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
