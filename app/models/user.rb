class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
    :remember_me, :name, :color, :hidden
  
  audited
  
  has_many :projects, through: :teams
  has_many :attachments, foreign_key: :uploader_id
  has_many :comments
  has_and_belongs_to_many :teams
  
  has_many :managed_stories, 
    class_name: "Story", 
    foreign_key: :user_id
    
  has_many :developer_stories, 
    class_name: "Story", 
    foreign_key: :user_id
  
  validates_presence_of :name, :email
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  default_scope order: "name ASC"
  scope :shown, where{hidden.eq false}
  
  # Darken the chosen color by 15%
  def alt_color
    c = color.gsub("#", "")
    rgb = c.scan(/../).map {|color| (color.hex.to_i * (0.85)).round }
    "#%02x%02x%02x" % rgb
  end
  
end