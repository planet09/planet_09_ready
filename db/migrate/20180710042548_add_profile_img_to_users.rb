class AddProfileImgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_img, :string
  end
end
