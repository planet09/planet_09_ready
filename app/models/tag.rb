class Tag < ActiveRecord::Base
  belongs_to :post

  
  has_many :posts_tags
  has_many :posts, through: :posts_tags




end
