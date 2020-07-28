class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :brewery_type
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :longitude, null: false
      t.string :latitude, null: false
      t.string :phone
      t.string :website_url
      t.text :tag_list

      t.timestamps
    end
  end
end
