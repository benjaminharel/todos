class User < ActiveRecord::Base
  attr_accessible :email
  validates_presence_of :email
  has_many :todos

  def swap_todo(todo)
    swap = todo.ind
    todo.ind = self.ind
    self.ind = swap.ind
    save! and todo.save!
  end
end
