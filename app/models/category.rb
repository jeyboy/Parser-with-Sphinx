class Category
  include Mongoid::Document
  #include Mongoid::Timestamps::Created

  field :title, :type => String

  has_many :topics, :dependent => :destroy

  validates :title, :presence => true, :uniqueness => true
end
