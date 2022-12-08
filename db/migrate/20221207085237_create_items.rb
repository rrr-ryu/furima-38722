class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :content,               null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :delivery_charge_id, null: false
      t.integer :sender_id,          null: false
      t.integer :delivery_day_id,    null: false
      t.integer :price,              null: false
      t.references :user,            null: false , foreign_key: true
      t.timestamps
    end
  end
end
