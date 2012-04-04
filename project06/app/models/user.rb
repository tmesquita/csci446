class User < ActiveRecord::Base
	acts_as_authentic
	has_many :games
	belongs_to :role

	has_attached_file :photo
	validates :first_name, :last_name, :presence => true
  validates :password, :confirmation => true, :presence => true, :on => :create
  validates_length_of :password, :minimum => 6, :on => :create
	validates_length_of :username, :minimum => 6

  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def get_role
    self.role.name.downcase
  end
  
  def is_member?
    self.get_role.eql? "member"
  end
  
  def is_admin?
    self.get_role.eql? "admin"
  end
  
  def to_s
    self.first_name + ' ' + self.last_name
  end
  
  def role_symbols
    [role.name.downcase.to_sym]
  end
end
