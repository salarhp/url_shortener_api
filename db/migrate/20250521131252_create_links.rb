class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.text :original_url
      t.string :slug
      t.integer :click_count, default: 0
      t.references :user, null: false, foreign_key: true
      t.datetime :expires_at
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :links, :slug
  end
end
