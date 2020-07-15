class CreateBreweryLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :brewery_likes do |t|
      t.belongs_to :brewery, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.belongs_to :user, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.index [:brewery_id, :user_id], unique: true
    end
  end
end
