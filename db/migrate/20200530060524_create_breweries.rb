class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :longitude
      t.string :latitude
      t.string :phone
      t.string :website_url
      t.text :tag_list

      t.timestamps
    end
  end
end
