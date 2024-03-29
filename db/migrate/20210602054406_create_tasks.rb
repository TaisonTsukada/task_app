class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :deadline, null: false
      t.integer :status, null: false, default: 0
      t.references :user
      t.timestamps
    end
  end
end
