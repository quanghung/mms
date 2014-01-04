class Position < ActiveRecord::Base
  has_many  :users
  validates :name, presence: true
  validates :short_name, presence: true
end
