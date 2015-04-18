class CreateSubemails < ActiveRecord::Migration
  def change
    create_table :subemails do |t|
      t.string :sub_email
      t.integer :user_id

      t.timestamps
    end
  end
end
