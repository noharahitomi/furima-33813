class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.text :info,           null: false
      t.

      t.timestamps
    end
  end
end
