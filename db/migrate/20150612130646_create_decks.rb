class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.integer :category_id, null: false
      t.integer :creator_id

      t.timestamps
    end
  end
end
