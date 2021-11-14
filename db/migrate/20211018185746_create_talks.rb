class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :text
      t.string :photo     
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
