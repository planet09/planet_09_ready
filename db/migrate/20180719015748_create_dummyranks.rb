class CreateDummyranks < ActiveRecord::Migration
  def change
    create_table :dummyranks do |t|
      t.string :rankname
      t.string :content

      t.timestamps null: false
    end
  end
end
