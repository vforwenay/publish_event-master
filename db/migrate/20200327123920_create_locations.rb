class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.float  :lat
      t.float  :lng
      t.string :country
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :address_line_1
      t.string :address_line_2
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
