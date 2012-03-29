class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :added_buy
      t.string :rating

      t.timestamps
    end
  end
end
