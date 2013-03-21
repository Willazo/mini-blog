class Post < ActiveRecord::Base
  attr_accessible :body, :title, :category

  validates :title, :category, :presence => true
  validates :title, :uniqueness => true

  before_validation :apply_title_format

  has_many :comments

private

  def apply_title_format
  	self[:title] = self[:title].strip.capitalize
  end

end
