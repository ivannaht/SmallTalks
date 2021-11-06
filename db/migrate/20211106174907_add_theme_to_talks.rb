class AddThemeToTalks < ActiveRecord::Migration[6.1]
  def change
    add_column :talks, :theme, :string
  end
end
