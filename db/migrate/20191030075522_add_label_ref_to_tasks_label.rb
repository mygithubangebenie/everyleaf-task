class AddLabelRefToTasksLabel < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks_labels, :label, foreign_key: true
  end
end
