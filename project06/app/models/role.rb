class Role < ActiveRecord::Base
  attr_accessible :name, :description
  
  validates :name, :presence => true
  validates_uniqueness_of :name
  
  has_many :users
  
  def to_s
    self.name
  end

  def after_initialize
    self.name = name.downcase.strip unless name.nil?
  end
    
  def name=(name)
    self[:name] = name.strip.downcase
  end
end
