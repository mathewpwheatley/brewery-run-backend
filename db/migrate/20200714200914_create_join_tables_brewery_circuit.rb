class CreateJoinTablesBreweryCircuit < ActiveRecord::Migration[6.0]
  def change
    create_join_table :breweries, :circuits do |t|
      t.index [:brewery_id, :circuit_id]
      t.index [:circuit_id, :brewery_id]
    end
  end
end
