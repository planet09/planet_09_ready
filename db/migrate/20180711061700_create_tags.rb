class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_id
      t.text :content
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
