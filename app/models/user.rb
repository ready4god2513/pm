class User < ActiveRecord::Base
  
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :attachments, foreign_key: :uploader_id
  has_many :comments
  has_many :requested_stories, 
    class_name: "Story", 
    foreign_key: :requestor_id
  has_many :owned_stories, 
    class_name: "Story", 
    foreign_key: :owner_id
  
  validates_presence_of :name, :email, :pivotal_id
  
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