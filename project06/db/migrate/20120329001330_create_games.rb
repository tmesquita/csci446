class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :user_id
      t.string :rating

      t.timestamps
    end
  end
end
