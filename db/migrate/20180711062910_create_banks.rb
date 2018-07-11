class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :bank_id
      t.string :bank_name

      t.timestamps null: false
    end
  end
end
