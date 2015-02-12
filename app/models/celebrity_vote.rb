class CelebrityVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :celebrity

  validates_uniqueness_of :user_id, scope: [:celebrity_id]
  validates_presence_of :vote_value
end
