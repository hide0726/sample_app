class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content

      t.timestamps
    end
    add_index :messages,[:sender_id, :receiver_id, :created_at]
  end
end
