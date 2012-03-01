class Author < ActiveRecord::Base
	has_many :articles
	validates :name, :presence => true
	validate :no_pats
	has_attached_file :photo

	private

		def no_pats
			if self.name.match(/(pat)/i)
				errors.add(:author, 'No Pats of anykind allowed here!')	
			end
		end

end
