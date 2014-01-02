class Position < ActiveRecord::Base
	default_scope where(active_flag: 1)
  has_many :users
  validates :name, presence: true
  validates :abbreviation, presence: true
end
