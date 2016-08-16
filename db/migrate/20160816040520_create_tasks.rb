class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
