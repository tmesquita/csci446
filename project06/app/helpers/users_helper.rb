module UsersHelper
	def last_login(user)
		unless user.last_login_at.nil?
			time_ago_in_words(user.last_login_at).humanize + ' ago'
		else
			"N/A"
		end
	end

end
