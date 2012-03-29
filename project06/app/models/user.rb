class User < ActiveRecord::Base
	acts_as_authentic
	has_many :games
	belongs_to :role

	validates :first_name, :last_name, :presence => true
	validates_length_of :password, :minimum => 6
end
