class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
   change_column :tasks, :name, :string, null: false
   change_column :tasks, :content, :text, null: false
   change_column :tasks, :status, :string, null: false
   change_column :tasks, :startdate, :date, null: false
   change_column :tasks, :enddate, :date, null: false
  end
end
