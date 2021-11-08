class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
