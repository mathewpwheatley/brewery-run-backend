class CreateCircuitReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :circuit_reviews do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :rating, null: false, default: 5
      t.belongs_to :circuit, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.belongs_to :user, null: false, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end