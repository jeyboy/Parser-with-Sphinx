
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :user, :type => String
  field :message, :type => String
  field :news_item_id, :type => String

  #key :news_id, :required => true

  belongs_to :news_item

  validates :news_item_id, :user, :message, :presence => true
end
