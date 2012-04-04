authorization do
  role :admin do
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_games, :to => :manage
    has_permission_on :admin_roles, :to => :manage
  end
  
  role :member do
    has_permission_on :home, :to => [:index]
    has_permission_on :member_games, :to => :manage
    has_permission_on :member_users, :to => :update do
      if_attribute :id => is { user.id }
    end
  end
  
  role :guest do
    has_permission_on :home, :to => :index
    has_permission_on :users, :to => :create
  end
  
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end