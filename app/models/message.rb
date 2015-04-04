class Message < ActiveRecord::Base

	has_many :intermediateones
    has_many :users, through: :intermediateones



end
