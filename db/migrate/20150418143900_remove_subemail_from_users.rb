class RemoveSubemailFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :sub_email, :string
  end
end
