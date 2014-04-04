class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.date :due_date
      t.boolean :completed?
      t.boolean :public?

      t.timestamps
    end
  end
end
