class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string  :postcode,      default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string  :city,          default: "",  null: false
      t.string  :block,         default: "",  null: false
      t.string  :building,      default: ""
      t.string  :phone_number,                null: false
      t.integer :purchase_id,                 null: false
      t.timestamps
    end
  end
end
