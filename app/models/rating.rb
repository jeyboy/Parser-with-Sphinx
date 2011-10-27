class Rating
  include Mongoid::Document
  field :gems, :type => Integer, :default => 1
  field :user_id, :type => String
  field :news_id, :type => String

  validates :gems, :numericality => {:greater_than => 0, :less_than => 6}
  validates :user_id, :uniqueness => {:scope => :news_id}
  validates :news_id, :presence => true
end
