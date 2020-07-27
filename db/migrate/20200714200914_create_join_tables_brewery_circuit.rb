class CreateJoinTablesBreweryCircuit < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries_circuits do |t|
      t.belongs_to :brewery, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.belongs_to :circuit, null: false, index: true, foreign_key: {on_delete: :cascade}
    end
  end
end
