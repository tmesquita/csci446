class Game < ActiveRecord::Base
	belongs_to :user

	RATINGS = %w[meh ok awesome]
end
