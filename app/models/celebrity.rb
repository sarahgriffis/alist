class Celebrity < ActiveRecord::Base
  has_many :celebrity_votes

  accepts_nested_attributes_for :celebrity_votes

  require 'wikipedia'


  def wikipedia_url
    page = Wikipedia.find("#{self.first_name}  #{self.last_name}" )
    page.image_urls[0]
  end
end
