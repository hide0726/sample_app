class RemoveProfilesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :sub_email, :string
    remove_column :users, :shozoku, :string
    remove_column :users, :gakukei, :string
    remove_column :users, :self_intro, :text
  end
end
