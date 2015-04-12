class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :abstract
      t.text :content
      t.integer :category_id
      t.integer :koukai
      t.integer :gentei

      t.timestamps
    end
    add_index :articles, [:category_id, :koukai, :created_at]
  end
end
