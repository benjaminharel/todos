class TodoList < ActiveRecord::Base
  has_many :todos, :order => :position
end
