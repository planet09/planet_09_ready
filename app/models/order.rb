class Order < ActiveRecord::Base
  serialize :options, Hash
  belongs_to :post
end
