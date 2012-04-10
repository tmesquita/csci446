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
		if current_user.nil? or (!game.created_by? current_user and !current_user.is_admin?)
        	game.created_at.strftime("%b. %d, %Y") + ' by ' + game.user.full_name
		elsif game.created_by? current_user
			if current_user.is_member?
        		game.created_at.strftime("%b. %d, %Y") + ' by me'
        	else
        		%(#{game.created_at.strftime("%b. %d, %Y")} by #{link_to('me', edit_admin_user_path(game.user))}).html_safe
    		end	
        elsif current_user.is_admin?
        	%(#{game.created_at.strftime("%b. %d, %Y")} by #{link_to(game.user.full_name, edit_admin_user_path(game.user))}).html_safe
        end
	end

	def game_rating(game)
		unless game.rating.blank?
			game.rating.humanize
		else
			"Unrated"
		end
	end

	def rating_percent
		total_games = Game.count(:all, :conditions => {:user_id => current_user.id})
		unless total_games.eql? 0
			non_rated_games = Game.count(:all, :conditions => {:user_id => current_user.id, :rating => nil})
			number_to_percentage(((1-(Float(non_rated_games)/total_games))*100), :precision => 0)
		else
			number_to_percentage(0, :precision => 0)
		end
	end
end
