class User < ActiveRecord::Base
  default_scope where(active_flag: 1)
  has_secure_password
  belongs_to :position
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :project_members
  has_many :projects, through: :project_members
  has_many :user_skills
  has_many :skills, through: :user_skills

  attr_accessor :not_destroy
  before_validation ->{self.email = email.downcase}
  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, unless: :not_destroy
  validates :position_id, presence: true
  scope :current_members_team, ->team do 
    joins(team_members: :team)
      .where("team_members.current_member_team_flag" => true,
        "team_members.active_flag" => true)
          .where("teams.id" => team.id)
  end

  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def encrypt token
      Digest::SHA1.hexdigest token.to_s
    end
  end

  private
  def create_remember_token
    self.remember_token = self.class.encrypt self.class.new_remember_token
  end
end
