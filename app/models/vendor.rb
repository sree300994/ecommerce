class Vendor < ActiveRecord::Base

	validates_presence_of :name, :email, :mobile
	validates_uniqueness_of :email, :mobile
end
