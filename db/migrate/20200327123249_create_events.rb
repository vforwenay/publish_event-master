class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name 
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status, default: 1
      t.references :user, index: true
      t.references :location, index: true
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
