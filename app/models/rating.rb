class Rating
  include Mongoid::Document
  field :gems, :type => Integer, :default => 1
  field :user_id, :type => String, :presence => true
  field :news_id, :type => String, :presence => true

  #key :user_id, :news_id, :require => true

  validates :gems, :numericality => {:greater_than => 0, :less_than => 6}
  validates :user_id, :uniqueness => {:scope => :news_id}
end
