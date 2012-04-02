authorization do
  role :administrator do
    has_permission_on :member_users, :to => :manage
    has_permission_on :member_games, :to => :manage
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_games, :to => :manage
  end
  
  role :developer do
    includes :administrator
    
  end
  
  role :member do
    has_permission_on :member_users, :to => :update
    has_permission_on :member_games, :to => :manage
 end
  
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete, :show, :update_stuff]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => [:edit]
  privilege :delete, :includes => :destroy
end