class CreateCircuits < ActiveRecord::Migration[6.0]
  def change
    create_table :circuits do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :public, null: false, default: false
      t.belongs_to :user, null: false, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end