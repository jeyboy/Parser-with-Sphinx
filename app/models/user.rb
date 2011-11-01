class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  field :user_name, :type => String

  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me
  has_many :ratings, :dependent => :destroy

  validates :user_name, :presence => true, :uniqueness => true, :length => 3..12
end
