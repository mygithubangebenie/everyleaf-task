class ChangeTaskPriority < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :integer
  end
end
