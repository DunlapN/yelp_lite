class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :cover_photo
      t.string :website

      t.timestamps

    end
  end
end
