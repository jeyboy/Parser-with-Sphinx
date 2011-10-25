class Comment
  include Mongoid::Document
  field :user, :type => String
  field :message, :type => String

  #key :news_id, :required => true

  belongs_to :newses

  validates :news_id, :presence => true
end
