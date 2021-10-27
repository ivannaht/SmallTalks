class AddFirstNameAndLastNameAndNicknameAndPhotoAndDobAndAgeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :photo, :string
    add_column :users, :dob, :date
    add_column :users, :age, :integer
  end
end
