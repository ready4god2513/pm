class Story < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :iteration
  belongs_to :state
  belongs_to :story_type
  belongs_to :requestor, class_name: "User"
  belongs_to :owner, class_name: "User"
  
  has_many :tasks
  has_many :attachments
  has_many :comments
  has_many :labels, as: :labelable
  
  validates_presence_of :project, :name, :state
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  scope :sorting
  
  scope :in_iterations, lambda {|iterations| 
    where{iteration_id.in my{iterations.map(&:id)}}
  }
  
  def shown?
    story_type.shown? && state.shown?
  end
  
end
