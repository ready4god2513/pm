class Story < ActiveRecord::Base
  
  audited
  
  belongs_to :project
  belongs_to :iteration
  belongs_to :state
  belongs_to :story_type
  has_and_belongs_to_many :managers, 
    class_name: "User",
    join_table: "managers_stories"
    
  has_and_belongs_to_many :developers,
    class_name: "User",
    join_table: "developers_stories"
  
  has_many :tasks
  has_many :attachments, as: :attachable
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
