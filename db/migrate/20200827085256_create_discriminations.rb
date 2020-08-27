class CreateDiscriminations < ActiveRecord::Migration[6.0]
  def change
    create_table :discriminations do |t|

      t.timestamps
    end
  end
end
