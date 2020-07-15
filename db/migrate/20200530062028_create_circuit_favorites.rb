class CreateCircuitFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :circuit_favorites do |t|
      t.belongs_to :circuit, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.belongs_to :user, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.index [:circuit_id, :user_id], unique: true
    end
  end
end