class AddSendmailToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :send_mail, :integer
  end
end
