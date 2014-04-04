class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :goal_id
      t.text :body

      t.timestamps
    end
  end
end
