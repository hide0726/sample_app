class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :content2, :text
    add_column :articles, :content3, :text
    add_column :articles, :content4, :text
  end
end
