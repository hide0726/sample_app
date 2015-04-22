class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :created, :boolean, default: false
  end
end
