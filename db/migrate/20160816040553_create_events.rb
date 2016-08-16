class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :json
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
