Article.delete_all
Author.delete_all

for i in (1..25)
	Article.create(	:id => i, 
					:title => 'Safe and Sound',
					:body => %{When we come down, o yeah yeah yeah 
								We'll be dreaming safe and sound 
								You better know why 
								Baby that's all I got,

								When we come down, o yeah yeah yeah 
								We'll be dreaming safe and sound 
								You better know why 
								O Baby that's all I got, O baby that's all I got

								Is This the kinda sound that you wanna hear, 
								Is This the kinda vibe that you wanna feel, 
								Well I'm the type of guy that you'll never fear, 
								You can do your thing then come near,},
					:author_id => 1,
					:date_posted => Time.now,
					:num_edits => 0)
end

Author.create (:id => 1, :name => 'bob saget')
Author.create (:id => 2, :name => 'George Costanza')
Author.create (:id => 3, :name => 'P.O.S.')