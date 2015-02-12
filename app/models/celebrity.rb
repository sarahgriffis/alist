class Celebrity < ActiveRecord::Base
  has_many :celebrity_votes

  accepts_nested_attributes_for :celebrity_votes
end
