class Topic
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Sphinx

  field :title, :type => String

  has_many :newses, :dependent => :destroy
  belongs_to :category

  search_index(:fields => [:title], :attributes => [])

  validates :title, :presence => true, :uniqueness => {:scope => :category_id}
end
