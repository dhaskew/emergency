class AddNameToApikeys < ActiveRecord::Migration
  def change
    add_column :apikeys, :name, :string
  end
end
