class Notification < ActiveRecord::Base 
	
	has_and_belongs_to_many :receivers, polymorphic: true
	belongs_to :sender, polymorphic: true
end
