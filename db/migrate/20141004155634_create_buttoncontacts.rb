class CreateButtoncontacts < ActiveRecord::Migration
  def change
    create_table :buttoncontacts do |t|
      t.references :button, index: true
      t.string :email
      t.string :sms

      t.timestamps
    end
  end
end
