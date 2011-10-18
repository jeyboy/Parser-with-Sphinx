class Topic
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  #extend ThinkingSphinx::ActiveRecord::ClassMethods

  field :title, :type => String, :required => true

  has_many :news, :dependent => :destroy
  belongs_to :category

  key :title, :category_id, :required => true

  #define_index do
  #  indexes title
  #  set_property :min_prefix_len => 2
  #end
end
