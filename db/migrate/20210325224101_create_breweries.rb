class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.bigint :phone
      t.string :brewery_type
      t.string :website_url
      t.string :street
      t.string :state
      t.string :city
      t.bigint :zip
      t.numeric :lat
      t.numeric :long
      t.integer :rating 

      t.timestamps
    end
  end
end
