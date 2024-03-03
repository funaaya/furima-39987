class CreateDeliveryAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_areas do |t|

      t.timestamps
    end
  end
end
