class AddImgToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :img, :string
    #remove_colume:테이블명, :컬럼:datatype
    #change_colume:posts, :title, :text
  end
end
