class Game < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true

	RATINGS = %w[LAME-O meh alright The_Bees_Knees]
end
