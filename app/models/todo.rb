class Todo < ActiveRecord::Base
  attr_accessible :checked, :description, :due_date, :position, :title, :todo_id, :user_id
  validates_presence_of :title
 # has_many :todos

  belongs_to :todo_list
  acts_as_list :scope => :todo_list

  belongs_to :user
#  belongs_to :todo
end
