class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cryptocurrency, null: false, foreign_key: true
      t.float :price
      t.string :operator

      t.timestamps
    end
  end
end
