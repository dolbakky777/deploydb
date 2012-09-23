class User < ActiveRecord::Base
  attr_accessible :user_id, :name, :password
end
