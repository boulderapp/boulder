class RemoveBioFromCharacters < ActiveRecord::Migration[7.0]
  def change
    remove_column :characters, :bio, :text
  end
end
