class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :intro
      t.text :body
      t.integer :user_id, index: true, foreign_key: true
      t.integer :supplier_id, index: true, foreign_key: true
      t.integer :category_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
