Product.delete_all

Product.create(:title => 'Beer n Sammich Machine',
  :description => 
    %{The last machine you'll ever need to buy},
  :image_url =>   'beer_machine.jpg',    
  :price => 1500.00)
# . . .

Product.create(:title => 'Tardis',
  :description =>
    %{If your beer n sammich machine breaks, you can use this to go
	    find another one},
  :image_url => 'tardis.jpg',
  :price => 49.99)
# . . .

Product.create(:title => 'ShamWOW',
  :description => 
    %{How else are you goint to keep your beer n sammich machine clean??},
  :image_url => 'sham_wow.jpg',
  :price => 9.99)