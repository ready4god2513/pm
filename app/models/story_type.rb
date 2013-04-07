class StoryType < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  has_many :stories
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name

  attr_accessible :sort_order, :name, :estimatable, :hidden
  
  default_scope order: "sort_order ASC"
  scope :shown, where{hidden.eq false}
  
  def shown?
    !hidden
  end
  
end