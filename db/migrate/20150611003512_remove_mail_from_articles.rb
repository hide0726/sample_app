class RemoveMailFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :mail, :boolean
  end
end
