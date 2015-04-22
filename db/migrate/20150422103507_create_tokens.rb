class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :user, null: false     # ユーザと紐付け
      t.string :uuid, null: false         # トークン
      t.datetime :expired_at, null: false
 
      t.timestamps
    end
    add_index :tokens, :user_id
  end
end
