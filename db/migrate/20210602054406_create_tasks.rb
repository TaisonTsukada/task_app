class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :deadline, null: false
      t.integer :status_id, null: false
      t.references :user
      t.timestamps
    end
  end
end
