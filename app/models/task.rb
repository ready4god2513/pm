class Task < ActiveRecord::Base
  
  audited
  
  belongs_to :story
  validates_presence_of :story
  has_many :attachments, as: :attachable
  
  default_scope order: "position ASC"
  
  attr_accessible :description, :position, :complete
  
end