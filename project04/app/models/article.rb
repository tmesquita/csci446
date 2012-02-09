class Article < ActiveRecord::Base
	validates :title, :body, :author, :presence => true
	validates_exclusion_of :author, :in => %w(pat PAT Pat PAt PaT paT pAT pAt ), :message => "NO PATS ALLOWED!!! SHOO!!"
end
