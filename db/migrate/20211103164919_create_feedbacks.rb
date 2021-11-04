class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :recommendation
      t.string :experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
