class Topic < ActiveRecord::Base
  has_many :news, :dependent => :destroy

  define_index do
    indexes title

    set_property :min_prefix_len => 2
  end
end
