class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      #t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.string :account
      t.string :account_name
      t.integer :goal
      t.string :price
      t.text :content
      t.string :option
      t.string :option_price
      t.string :rel_project1_url
      t.string :rel_project2_url

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
