class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.belongs_to :followee, null: false, index: true, foreign_key: {to_table: :users, on_delete: :cascade}
      t.belongs_to :follower, null: false, index: true, foreign_key: {to_table: :users, on_delete: :cascade}
      t.index [:followee_id, :follower_id], unique: true
    end
  end
end


