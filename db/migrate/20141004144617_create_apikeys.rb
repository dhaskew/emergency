class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.references :user, index: true
      t.string :token

      t.timestamps
    end
  end
end
