class AddSubemailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sub_email, :string
  end
end
