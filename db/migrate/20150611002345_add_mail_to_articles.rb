class AddMailToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :mail, :boolean
  end
end
