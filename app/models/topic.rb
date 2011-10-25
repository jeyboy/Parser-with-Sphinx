class Topic
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Sphinx

  field :title, :type => String, :required => true

  has_many :newses, :dependent => :destroy
  belongs_to :category

  #key :title, :category_id, :required => true

  search_index(:fields => [:title], :attributes => [])
end
