class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
