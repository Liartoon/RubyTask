class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :sender
      t.string :comment_text
      t.integer :ta_duty_id
      t.string :ta_duty_type

      t.timestamps
    end
  end
end
