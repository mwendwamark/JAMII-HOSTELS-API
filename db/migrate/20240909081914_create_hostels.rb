class CreateHostels < ActiveRecord::Migration[7.1]
  def change
    create_table :hostels do |t|
      t.references :landlord, null: false, foreign_key: true
      t.string :hostel_name
      t.string :location
      t.float :price_per_month
      t.string :hostel_type
      t.boolean :toilet
      t.boolean :kitchen
      t.boolean :wifi
      t.boolean :study_room
      t.boolean :balcony
      t.boolean :gym
      t.boolean :wardrobe
      t.boolean :laundry_services
      t.integer :avaliable_units
      t.boolean :parking
      t.string :room_type
      t.boolean :hot_shower
      t.boolean :garden
      t.boolean :swimming_pool
      t.boolean :air_conditioner
      t.boolean :cctv_cameras
      t.boolean :fire_extinguishers
      t.boolean :first_aid_kits
      t.boolean :smoke_alarm
      t.text :description
      t.string :water_supply
      t.boolean :buy_own_tokens
      t.boolean :fully_furnished
      t.boolean :security

      t.timestamps
    end
  end
end
