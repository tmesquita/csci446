Role.create!(:name => 'admin', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A member of the site')

User.create!(:username => 'administrator', :password => 'password', :password_confirmation => 'password', :first_name => 'Adolf', :last_name => 'Coors', :email => 'admin@gamez.com', :role_id => Role.find_or_create_by_name("admin").id)
User.create!(:username => 'member', :password => 'password', :password_confirmation => 'password', :first_name => 'Matz', :last_name => 'Matsumoto', :email => 'member@gamez.com', :role_id => Role.find_or_create_by_name("member").id)

(1..30).each do |i|
	Game.create!(:title => 'Wisest Wizard', :rating => 'meh', :user_id => 1)
end