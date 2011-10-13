class Topic < ActiveRecord::Base
  has_many :news, :dependent => :destroy
  belongs_to :topic

  define_index do
    indexes title

    set_property :min_prefix_len => 2
  end

  validates :title ,:presence => true
end
