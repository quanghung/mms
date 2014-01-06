class Project < ActiveRecord::Base
  has_many :project_users
  has_many :users, through: :project_users
  belongs_to :team

  validates :name, presence: true
  validates :short_name, presence: true, length: {maximum: 45}
  validates :start_date, presence: true
  validates :end_date, presence: true
end
