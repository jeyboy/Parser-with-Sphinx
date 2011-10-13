class News < ActiveRecord::Base
  belongs_to :topic

  define_index do
    indexes body
    indexes title

    set_property :min_prefix_len => 2
  end

  validates :title , :body, :presence => true
end
