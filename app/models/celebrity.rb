class Celebrity < ActiveRecord::Base
  has_many :celebrity_votes

  accepts_nested_attributes_for :celebrity_votes
  validates_uniqueness_of :first_name, scope: [:last_name]

  scope :active, -> { where("active") }

  require 'wikipedia'


  def wikipedia_url
    if self.last_name.blank?
      page = Wikipedia.find("#{self.first_name}  (entertainer)" )
    else
      page = Wikipedia.find("#{self.first_name}  #{self.last_name}" )
    end
    page.image_urls[0]

  end

  def bulk_import(csv_file)
    binding.pry
  end
end
