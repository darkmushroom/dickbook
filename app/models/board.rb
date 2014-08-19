class Board < ActiveRecord::Base
  has_one :user
  
  validates_presence_of :owner
  validates_presence_of :title
  validates_presence_of :user_id
end
