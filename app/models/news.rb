class News
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Sphinx

  field :title, :type => String
  field :body,  :type => String

  #key :topic_id, :title, :required => true

  belongs_to :topic
  has_many :comments

  search_index(:fields => [:title, :body],:attributes => [])
end
