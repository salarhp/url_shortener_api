class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
    add_index :users, :email
  end
end
