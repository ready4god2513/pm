class Story < ActiveRecord::Base
  
  audited
  acts_as_nested_set
  
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

  attr_accessible :name, :estimate, :description, :priority
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  default_scope order: "priority desc"
  
  scope :started_or_completed, lambda { |team|
    where{state_id.in my{team.states.started.map(&:id)}}
  }

  scope :completed, lambda {|iteration|
    where{completed.eq true}
  }
  
  def started_or_completed?
    state != iteration.team.states.first
  end
  
  def shown?
    story_type.shown? && state.shown?
  end
  
end
