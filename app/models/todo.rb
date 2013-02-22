class Todo < ActiveRecord::Base
  attr_accessible :checked, :description, :due_date, :position, :title, :todo_id, :user_id
  validates_presence_of :title
  acts_as_list :scope => :user
  belongs_to :user
end
