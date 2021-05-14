class CreateAddressees < ActiveRecord::Migration[6.0]
  def change
    create_table :addressees do |t|
      t.integer  :post_code, null: false
      t.string   :prefecture_id,  null: false
      t.string   :municipality,   null: false
      t.string   :address,        null: false
      t.string   :building_name
      t.integer  :tel_number,     null: false
      t.references :purchase,     foreign_key: true
      t.timestamps
    end
  end
end
