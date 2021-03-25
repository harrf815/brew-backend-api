class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.integer :phone
      t.string :brewery_type
      t.string :website_url
      t.string :street
      t.string :state
      t.string :city
      t.integer :zip
      t.integer :lat
      t.integer :long

      t.timestamps
    end
  end
end
