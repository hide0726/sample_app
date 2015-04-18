class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :shozoku
      t.string :gakukei
      t.text :self_intro

      t.timestamps
    end
  end
end
