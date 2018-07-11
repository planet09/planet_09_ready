class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :p_id
      t.string :p_name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :account
      t.integer :goal
      t.integer :price
      t.text :body
      t.string :option
      t.string :rel_project1_url
      t.string :rel_project2_url
      t.references :comment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
