class AddProfilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sub_email, :string
    add_column :users, :shozoku, :string
    add_column :users, :gakukei, :string
    add_column :users, :self_intro, :text
  end
end
