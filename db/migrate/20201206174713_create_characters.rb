class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :collection_number
      t.integer :point_value
      t.boolean :trait_symbol
      t.integer :range
      t.integer :total_clicks
      t.integer :targets

      t.timestamps
    end
  end
end
