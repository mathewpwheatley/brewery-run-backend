class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :link
      t.boolean :read, default: false
      t.belongs_to :user, null: false, index: true, foreign_key: {on_delete: :cascade}
    end
  end
end
