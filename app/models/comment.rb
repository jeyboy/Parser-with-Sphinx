class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :user, :type => String
  field :message, :type => String

  #key :news_id, :required => true

  belongs_to :newses

  validates :news_id, :user, :message, :presence => true
end
