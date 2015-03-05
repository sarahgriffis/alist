class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :celebrity_votes
  has_many :celebrities, :through => :celebrity_votes

  scope :admin, -> { where(admin: true) }
end