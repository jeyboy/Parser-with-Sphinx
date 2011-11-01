class NewsItem
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Sphinx

  field :title, :type => String
  field :body,  :type => String

  belongs_to :topic
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy

  validates :title, :body, :presence => true

  search_index(:fields => [:title, :body],:attributes => [])
end
