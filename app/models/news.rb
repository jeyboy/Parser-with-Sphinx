class News
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  #include Mongoid::Sphinx

  field :title, :type => String, :required => true, :primary_key => true
  field :body,  :type => String, :required => true

  key :topic_id, :title, :required => true

  belongs_to :topic

  #search_index(:fields => [:title, :body])
end
