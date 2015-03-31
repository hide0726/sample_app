class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.integer :option

      t.timestamps
    end
    add_index :entries, [:user_id, :micropost_id, :created_at]
  end
end
