class Author < ActiveRecord::Base
	has_many :articles
	
	validate :no_pats

	private

		def no_pats
			if self.author.match(/(pat)/i)
				errors.add(:author, 'No Pats of anykind allowed here!')	
			end
		end

end
