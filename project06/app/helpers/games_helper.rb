module GamesHelper
	def game_title(game)
		if current_user.nil?
			game.title
		elsif current_user.is_member?
			if game.created_by? current_user
				link_to game.title, edit_member_game_path(game)
			else
				game.title
			end
		else
			link_to game.title, edit_admin_game_path(game)
		end
	end

	def game_date(game)
		if !current_user.nil? and game.created_by? current_user
        	game.created_at.strftime("%b. %d, %Y") + ' by me'
        else
        	game.created_at.strftime("%b. %d, %Y") + ' by ' + game.user.full_name
        end
	end

	def game_rating(game)
		game.rating.humanize
	end
end
