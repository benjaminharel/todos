class User < ActiveRecord::Base
  attr_accessible :email
  validates_presence_of :email
  has_many :todos, :order => :position

end
