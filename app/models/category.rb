class Category
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :title, :type => String, :required => true

  has_many :topics, :dependent => :destroy
  has_many :newses
end
