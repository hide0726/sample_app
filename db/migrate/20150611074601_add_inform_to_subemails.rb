class AddInformToSubemails < ActiveRecord::Migration
  def change
    add_column :subemails, :inform, :integer
  end
end
