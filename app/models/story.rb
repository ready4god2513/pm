class Story < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :iteration
  belongs_to :state
  belongs_to :story_type
  belongs_to :requestor, class_name: "User"
  belongs_to :owner, class_name: "User"
  
  has_many :tasks
  has_many :attachments
  has_many :notes
  has_many :labels, as: :labelable
  
  validates_presence_of :project, :pivotal_id, :name, :state
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
