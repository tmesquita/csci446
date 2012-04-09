class Game < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true

	RATINGS = %w[LAME-O meh alright The_Bees_Knees]

	def created_by?(user)
		self.user_id == user.id
	end
end
