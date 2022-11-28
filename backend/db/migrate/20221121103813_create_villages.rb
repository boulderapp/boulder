class CreateVillages < ActiveRecord::Migration[7.0]
  def change
    create_table :villages do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
