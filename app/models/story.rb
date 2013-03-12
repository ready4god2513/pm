class Story < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :iteration
  
  has_many :tasks
  has_many :attachments
  has_many :notes
  
  validates_presence_of :project, :pivotal_id, :name, :current_state
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
