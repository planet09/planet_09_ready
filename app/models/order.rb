class Order < ActiveRecord::Base
  serialize :options, Hash
end
