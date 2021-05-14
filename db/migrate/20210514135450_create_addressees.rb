class CreateAddressees < ActiveRecord::Migration[6.0]
  def change
    create_table :addressees do |t|

      t.timestamps
    end
  end
end
