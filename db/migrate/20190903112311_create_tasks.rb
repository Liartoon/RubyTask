class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.integer :assignee_id
      t.string :status, default: "To Do"
      t.text :description
      t.integer :created_by_id

      t.string :type

      t.timestamps
    end
  end
end
