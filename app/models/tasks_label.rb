class TasksLabel < ApplicationRecord
  #belongs_to :user
  belongs_to :task
  belongs_to :label
end
