class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :content
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
