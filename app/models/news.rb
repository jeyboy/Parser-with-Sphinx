class News
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  #include ThinkingSphinx::ActiveRecord

  field :title, :type => String, :required => true, :primary_key => true
  field :body,  :type => String, :required => true

  key :topic_id, :title, :required => true

  belongs_to :topic

  #define_index do
  #  indexes body
  #  indexes title
  #
  #  set_property :min_prefix_len => 2
  #end
end
