class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true, index: true
      t.string :password_digest, null: false
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :about

      t.timestamps
    end
  end
end
