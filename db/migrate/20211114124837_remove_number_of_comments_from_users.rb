class RemoveNumberOfCommentsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :number_of_comments, :integer
  end
end
