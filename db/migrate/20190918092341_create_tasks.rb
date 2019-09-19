class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.date :startdate
      t.date :enddate
      t.text :content

      t.timestamps
    end
  end
end
