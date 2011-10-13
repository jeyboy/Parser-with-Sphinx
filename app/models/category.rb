class Category < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :news, :through =>  :topics

  validates :title ,:presence => true
end
