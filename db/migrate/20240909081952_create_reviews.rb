class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :hostel, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.text :comments
      t.integer :likes

      t.timestamps
    end
  end
end
