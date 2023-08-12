class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name , null: false
      t.boolean :administrator , null: false , default: false
      t.string :painting_taste
      t.string :feeling
      t.timestamps
    end
  end
end
